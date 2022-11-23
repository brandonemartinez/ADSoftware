using Core.Models;

namespace Core.Repositories
{
    public interface IOficioRepository : IRepository<Oficio>
    {
        Task<Oficio> GetByName(string nombre);
    }
}
