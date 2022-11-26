namespace Api.Resources.Reporte
{
    public class ServiciosContratadosResponse
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string? Estado { get; set; }
        public string? Localidad { get; set; }
        public int IdCliente { get; set; }
        public int IdEspecialista { get; set; }
    }
}
