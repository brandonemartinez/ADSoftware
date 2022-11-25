using Core.Models;
using Core.Services;
using Services.Mapping;

namespace Services
{
    public class DisponibilidadService : IDisponibilidadService
    {
        public async Task<bool> ValidarDisponibilidad(Especialista especialista, Cita cita)
        {
            bool disponible = true;
            string[] diasDisponible = especialista.RangoDia.Split(",");
            var dia = MapDaysOfWeek.MapDaysOfWeekLanguage(cita.Fecha.DayOfWeek.ToString());
            if (cita.HoraDesde < especialista.HoraDesde || cita.HoraHasta > especialista.HoraHasta)
            {
                disponible = false;
            }
            
            if (diasDisponible.Contains(dia))
            {
                disponible = true;
            }

            return disponible;
        }
    }
}
