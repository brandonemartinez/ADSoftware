using Core.Models;

namespace Core.Services
{
    public interface IOficioService
    {
        Task<bool> CreateOficio(Oficio oficio);
        Task<bool> EliminarOficio(int id);
        Task<IEnumerable<Oficio>> GetAll();
    }
}
