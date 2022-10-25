namespace Dtos.Dto.Especialista
{
    public class ListFilter
    {
        public string Nombre { get; set; }
        public string? Localidad { get; set; }
        public string Oficio { get; set; }
        public decimal? Calificacion { get; set; }
        public decimal? CalificacionDesde { get; set; }
        public decimal? CalificacionHasta { get; set; }
        public int? Page { get; set; }
        public string OrderBy { get; set; }
        public bool OrderByMethod { get; set; }
    }
}
