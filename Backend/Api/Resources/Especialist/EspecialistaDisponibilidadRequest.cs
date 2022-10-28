using Microsoft.VisualBasic;

namespace Api.Resources.Especialist
{
    public class EspecialistaDisponibilidadRequest
    {
        /// <summary>
        /// Id de Especialista
        /// </summary>
        public int IdUsuario { get; set; }
        /// <summary>
        /// Departamentos
        /// </summary>
        public List<DepartamentoCiudadRequest> Departamentos { get; set; }
        /// <summary>
        /// Listado de disponibilidad
        /// </summary>
        public List<DisponibilidadRequest> Disponibilidad { get; set; } 

    }

    public class DepartamentoCiudadRequest
    {
        public string Departamento { get; set; }
        public string[] Ciudades { get; set; }
    }

    public class DisponibilidadRequest
    {
        /// <summary>
        /// DD/MM/YYYY
        /// </summary>
        public string Fecha { get; set; }
        /// <summary>
        /// Hora desde 1 - 24
        /// </summary>
        public int HoraDesde { get; set; }
        /// <summary>
        /// Hora Hasta 1 - 24
        /// </summary>
        public int HoraHasta { get; set; }
    }
}
