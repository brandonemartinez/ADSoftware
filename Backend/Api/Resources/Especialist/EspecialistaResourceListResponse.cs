namespace Api.Resources.Especialist
{
    public class EspecialistaResourceListResponse
    {
        public string Nombre { get; set; }
        public int? Calificacion { get; set; }
        public List<EspecialistaOficioListResponse> Oficios { get; set; }
    }
}
