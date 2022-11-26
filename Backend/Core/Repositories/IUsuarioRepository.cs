using Core.Models;

namespace Core.Repositories
{
    public partial interface IUsuarioRepository : IRepository<Usuario>
    {
        Task<Usuario> GetEspecialistaByIdCompleteAsync(int id);
        void UpdateCompleteEspecialistAsync(Usuario user);
        Task<Usuario> GetUsuarioLoginAsync(string correo, string contrasenia);
        Task<Usuario> GetByCorreo(string correo);
    }
}
