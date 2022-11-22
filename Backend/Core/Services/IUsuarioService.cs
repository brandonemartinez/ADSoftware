using Core.Models;

namespace Core.Services
{
    public interface IUsuarioService
    {
        Task<IEnumerable<Usuario>> GetAll();
        Task<Usuario> CreateEspecialist(Usuario usuario);
        Task<Usuario> CreateAlreadyEspecialist(Usuario usuario);
        Task<Usuario> GetById(int id);
        Task<Usuario> UpdateEspecialist(Usuario userToUpdate);
        Task<bool> UserActivation(int id, bool activacion);
        Task<Usuario> CreateUsuario(Usuario userToCreate);
        Task<Usuario> UpdateClient(Usuario userToUpdate);
    }
}
