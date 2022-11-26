namespace Api.Resources.Reporte
{
    public class ReporteServiciosContratadosResponse
    {
        public int Pagina { get; set; }
        public int TotalElementos { get; set; }
        public int CantidadElementosPagina { get; set; } = 20;
        public List<ServiciosContratadosResponse> Elementos { get; set; }
    }
}
