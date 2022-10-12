using Core.Models;

namespace Core.Repositories
{
    public partial interface IEspecialistaRepository : IRepository<Especialista>
    {
        Task<Especialista> GetEspecialistaByIdCompleteAsync(string documento);
        Task<IEnumerable<Especialista>> GetEspecialistasCompleteAsync();
    }
}
