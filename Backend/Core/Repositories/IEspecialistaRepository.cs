using Core.Models;

namespace Core.Repositories
{
    public partial interface IEspecialistaRepository : IRepository<Especialista>
    {
        Task<Especialista> GetEspecialistaByIdCompleteAsync(string documento);
        Task<IEnumerable<Especialista>> GetEspecialistasCompleteAsync();
        Task<IEnumerable<Especialista>> GetEspecialistaFilter(string nombre, string apellido, string oficio, decimal? calificacion, string orderBy, bool orderByMethod);
    }
}
