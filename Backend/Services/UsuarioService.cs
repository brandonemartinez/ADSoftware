using Core;
using Core.Models;
using Core.Services;

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

        public async Task<Usuario> CreateEspecialist(Usuario nuevoUsuario)
        {
            if (await ValidateAlreadyCreatedUserEspecialist(nuevoUsuario))
                throw new ArgumentException($"El Especialista con Documento: {nuevoUsuario.Documento} ya esta creado.");

            await _unitOfWork.UsuarioRepository.CreateAsync(nuevoUsuario);
            await _unitOfWork.CommitAsync();
            return nuevoUsuario;
        }
        public async Task<Usuario> CreateClient(Usuario nuevoUsuario)
        {
            if (await ValidateAlreadyCreatedUserClient(nuevoUsuario))
                throw new ArgumentException($"El Cliente con Documento: {nuevoUsuario.Documento} y Correo: {nuevoUsuario.Correo} ya esta creado.");

            await _unitOfWork.UsuarioRepository.CreateAsync(nuevoUsuario);
            await _unitOfWork.CommitAsync();
            return nuevoUsuario;
        }
        public async Task<Usuario> GetById(string documento)
        {
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetByStringIdAsync(documento);
            return usuario;
        }

        private async Task<bool> ValidateAlreadyCreatedUserEspecialist(Usuario nuevoUsuario)
        {
            bool exists = false;
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(nuevoUsuario.Documento);
            if (usuario != null) exists = true;
            return exists;
        }

        private async Task<bool> ValidateAlreadyCreatedUserClient(Usuario nuevoUsuario)
        {
            bool exists = false;
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetClienteByIdOrEmailCompleteAsync(nuevoUsuario.Documento, nuevoUsuario.Correo);
            if (usuario != null) exists = true;
            return exists;
        }

    }
}
