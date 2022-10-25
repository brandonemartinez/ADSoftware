using Core.Models;

namespace Core.Repositories
{
    public partial interface IUsuarioRepository : IRepository<Usuario>
    {
        Task<Usuario> GetEspecialistaByIdCompleteAsync(string documento);
        Task<Usuario> GetClienteByIdCompleteAsync(string documento);
        Task<Usuario> GetClienteByIdOrEmailCompleteAsync(string documento, string email);
        void UpdateCompleteEspecialistAsync(Usuario user);
        void UpdateCompleteClientAsync(Usuario user);
    }
}
