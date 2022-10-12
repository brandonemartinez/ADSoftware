namespace Api.Resources.Especialist
{
    public class EspecialistaResourceListResponse
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public int IdDepartamento { get; set; }
        public int? Calificacion { get; set; }
    }
}
