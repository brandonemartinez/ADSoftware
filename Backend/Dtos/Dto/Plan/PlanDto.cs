namespace Dtos.Dto.Plan
{
    public class PlanDto
    {
        public int Id { get; set; }
        public decimal Precio { get; set; }
        public int CantidadCiudades { get; set; }
        public string Nombre { get; set; } = null!;
        public int CantidadProfesiones { get; set; }
    }
}
