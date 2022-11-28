using Dtos.Dto;
using Dtos.Dto.Archivo;

namespace Data.Dto.Especialista
{
    public class EspecialistaDto
    {
        public int? Id { get; set; }
        public string RazonSocial { get; set; } = null!;
        public string NombreFantasia { get; set; } = null!;
        public string Presentacion { get; set; } = null!;
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Rut { get; set; }
        //public int? Calificacion { get; set; }
        public string? RangoDia { get; set; }
        public int? HoraDesde { get; set; }
        public int? HoraHasta { get; set; }
        public string? DepartamentoDisponible { get; set; }
        public List<OficioDetalleDto> Oficios { get; set; } = null!;
        public List<ArchivoDto> Archivos { get; set; } = null!;
    }
}
