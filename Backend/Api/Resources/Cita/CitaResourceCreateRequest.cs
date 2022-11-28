namespace Api.Resources.Cita
{
    public class CitaResourceCreateRequest
    {
        public DateTime Fecha { get; set; }
        public int HoraDesde { get; set; }
        public int HoraHasta { get; set; }
        public int IdEspecialista { get; set; }
        public int IdCliente { get; set; }
        public string Localidad { get; set; }
        public string Descripcion { get; set; }
    }
}
