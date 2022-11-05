namespace Dtos.Dto.Cita
{
    public class CitaDto
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public TimeSpan HoraDesde { get; set; }
        public TimeSpan HoraHasta { get; set; }
        public bool? EstadoPago { get; set; }
        public string? Estado { get; set; }
        public string? Localidad { get; set; }
    }
}
