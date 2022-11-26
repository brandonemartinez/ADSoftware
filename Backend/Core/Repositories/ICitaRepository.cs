using Core.Models;

namespace Core.Repositories
{
    public interface ICitaRepository : IRepository<Cita>
    {
        Task<IEnumerable<Cita>> GetAllById(int id);
        Task<Cita> GetByIdCompleteAsync(int id);
        Task<IEnumerable<Cita>> GetAllByEspecialistaId(int id);
        Task<IEnumerable<Cita>> GetAllByClienteId(int id);
        Task<Tuple<int, IEnumerable<Cita>>> GetAllPaginated(int pagina);
    }
}
