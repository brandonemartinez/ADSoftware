using Core.Models;

namespace Core.Repositories
{
    public interface ICitaRepository : IRepository<Cita>
    {
        Task<IEnumerable<Cita>> GetAllById(int id);
        Task<Cita> GetByIdCompleteAsync(int id);
    }
}
