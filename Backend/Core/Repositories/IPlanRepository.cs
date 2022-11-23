using Core.Models;

namespace Core.Repositories
{
    public interface IPlanRepository : IRepository<Paquete>
    {
        Task<Paquete> GetByName(string name);
    }
}
