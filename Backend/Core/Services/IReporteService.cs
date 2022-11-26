using Core.Models;

namespace Core.Services
{
    public interface IReporteService
    {
        Task<Tuple<int, IEnumerable<Cita>>> GetServiciosContratados(int pagina);
    }
}
