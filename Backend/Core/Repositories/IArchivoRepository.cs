using Core.Models;

namespace Core.Repositories
{
    public interface IArchivoRepository : IRepository<Archivo>
    {
        Task<Archivo> GetByEspecialistaId(int idEspecialista);

    }
}
