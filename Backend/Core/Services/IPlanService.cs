using Core.Models;

namespace Core.Services
{
    public interface IPlanService
    {
        Task<bool> Create(Paquete plan);
        Task<IEnumerable<Paquete>> GetAll();
        Task<Paquete> GetById(int idPlan);
    }
}
