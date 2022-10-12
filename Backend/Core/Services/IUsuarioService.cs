using Core.Models;

namespace Core.Services
{
    public interface IUsuarioService
    {
        Task<IEnumerable<Usuario>> GetAll();
        Task<Usuario> CreateEspecialist(Usuario usuario);
        Task<Usuario> CreateClient(Usuario usuario);

        Task<Usuario> GetById(string documento);
    }
}
