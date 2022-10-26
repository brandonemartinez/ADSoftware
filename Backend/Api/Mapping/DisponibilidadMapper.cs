using Api.Resources.Especialist;
using Core.Models;

namespace Api.Mapping
{
    public static class DisponibilidadMapper
    {
        public static IEnumerable<Disponibilidad> MapDisponibilidad(EspecialistaDisponibilidadRequest disponibilidadRequest)
        {
            List<Disponibilidad> resultDisponibilidad = new List<Disponibilidad>();

            foreach (var dr in disponibilidadRequest.Disponibilidad)
            {
                resultDisponibilidad.Add(new Disponibilidad
                {
                    Documento = disponibilidadRequest.IdDocumento,
                    Fecha = Convert.ToDateTime(dr.Fecha),
                    HoraDesde = TimeSpan.FromHours(dr.HoraDesde),
                    HoraHasta = TimeSpan.FromHours(dr.HoraHasta),
                    Id = new Random().Next(999999),
                });
            }
            return resultDisponibilidad;
        
        }
    }
}
