using Core;
using Core.Services;
using Data.Models;

namespace Services
{
    public class UsuarioService : IUsuarioService
    {
        private readonly IUnitOfWork _unitOfWork;
        public UsuarioService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<Usuario>> GetAll()
        {
            IEnumerable<Usuario> usuario = await _unitOfWork.UsuarioRepository.GetAllAsync();
            return usuario;
        }

        public async Task<Usuario> GetById(string documento)
        {
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetByStringIdAsync(documento);
            return usuario;
        }
        public async Task<Usuario> Create(Usuario nuevoUsuario)
        {
            await _unitOfWork.UsuarioRepository.CreateAsync(nuevoUsuario);
            await _unitOfWork.CommitAsync();
            return nuevoUsuario;

        }
    }
}
