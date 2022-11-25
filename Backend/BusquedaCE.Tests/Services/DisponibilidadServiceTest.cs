using Core.Models;
using Core.Services;
using Xunit;

namespace BusquedaCE.Tests.Services
{
    public class DisponibilidadServiceTest
    {
        private readonly IDisponibilidadService _disponibilidadService;
        public DisponibilidadServiceTest(IDisponibilidadService disponibilidadService)
        {
            _disponibilidadService = disponibilidadService;
        }

        [Fact]
        public void ValidarDisponibilidad_Correcto()
        {
            var cita = GetCita();
            var especialista = GetEspecialsita();
            var result = _disponibilidadService.ValidarDisponibilidad(especialista, cita).GetAwaiter().GetResult();

            Assert.True(result);
        }

        public Cita GetCita()
        {
            return new Cita
            {
                Fecha = new DateTime(2021, 10, 10),
                HoraDesde = new TimeSpan(10, 0, 0),
                HoraHasta = new TimeSpan(20, 0, 0)
            };
        }

        public Especialista GetEspecialsita()
        {
            return new Especialista
            {
                RangoDia = "Lunes, Martes, Miercoles",
                HoraDesde = new TimeSpan(8, 0, 0),
                HoraHasta = new TimeSpan(20, 0, 0),
            };
        }
    }
}