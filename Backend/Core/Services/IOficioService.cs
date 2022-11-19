using Core.Models;

namespace Core.Services
{
    public interface IOficioService
    {
        Task<bool> CreateOficio(Oficio oficio);
        Task<IEnumerable<Oficio>> GetAll();
    }
}
