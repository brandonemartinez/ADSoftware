namespace Api.Resources.Plan
{
    public class PlanListResourceResponse
    {
        public int Id { get; set; }
        public decimal PrecioMensual { get; set; }
        public decimal PrecioAnual { get; set; }
        public int CantidadCiudades { get; set; }
        public string Nombre { get; set; } = null!;
        public int CantidadProfesiones { get; set; }
    }
}
