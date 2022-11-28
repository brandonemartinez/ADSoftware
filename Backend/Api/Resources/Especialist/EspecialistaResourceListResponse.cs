using Dtos.Dto;

namespace Api.Resources.Especialist
{
    public class EspecialistaResourceListResponse
    {
        public int Id { get; set; }
        public string RazonSocial { get; set; } = null!;
        public string Rut { get; set; } = null!;
        public string NombreFantasia { get; set; } = null!;
        public string? Presentacion { get; set; }
        public int? Calificacion { get; set; }
        public string? RangoDia { get; set; }
        public int HoraDesde { get; set; }
        public int HoraHasta { get; set; }
        public string? DepartamentoDisponible { get; set; }
        public int IdPaquete { get; set; }
        public virtual ICollection<OficioDetalleDto> Oficios { get; set; }
    }
}
