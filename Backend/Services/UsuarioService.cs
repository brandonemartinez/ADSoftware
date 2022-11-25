using Api.Utilities;
using Core;
using Core.Models;
using Core.Services;
using Services.Constants;
using Services.Mapping;

namespace Services
{
    public class UsuarioService : IUsuarioService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IEmailService _emailService;
        public UsuarioService(IUnitOfWork unitOfWork, IEmailService emailService)
        {
            _unitOfWork = unitOfWork;
            _emailService = emailService;
        }
        public async Task<Usuario> CreateUsuario(Usuario nuevoUsuario)
        {
            try
            {
                nuevoUsuario.Contrasenia = Encrypt.GetSHA256(nuevoUsuario.Contrasenia);
                nuevoUsuario.Rol = Roles.CLIENTE;
                nuevoUsuario.Activo = true;
                await _unitOfWork.UsuarioRepository.CreateAsync(nuevoUsuario);
                await _unitOfWork.CommitAsync();
                return nuevoUsuario;
            }
            catch (Exception exe)
            {

                throw new ArgumentException(exe.Message);
            }

        }

        public async Task<IEnumerable<Usuario>> GetAll()
        {
            IEnumerable<Usuario> usuario = await _unitOfWork.UsuarioRepository.GetAllAsync();
            return usuario;
        }

        public async Task<Usuario> CreateEspecialist(Usuario nuevoUsuario)
        {
            try
            {
                nuevoUsuario.Contrasenia = Encrypt.GetSHA256(nuevoUsuario.Contrasenia);
                nuevoUsuario.Rol = Roles.ESPECIALISTA;
                nuevoUsuario.Activo = true;
                await _unitOfWork.UsuarioRepository.CreateWithAttach(nuevoUsuario);
                await _unitOfWork.CommitAsync();
                _emailService.EnviarEmailCuentaCreada(nuevoUsuario.Correo, nuevoUsuario.Nombre);
                return nuevoUsuario;
            }
            catch
            {
                throw;
            }
        }
        public async Task<Usuario> GetById(int id)
        {
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetByIdAsync(id);
            return usuario;
        }
        public async Task<Usuario> UpdateEspecialist(Usuario userToUpdate)
        {
            Usuario userDb = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(userToUpdate.Id);

            UdpateEspecialistMapper.MapEspecialistToUpdate(userDb, userToUpdate);

            _unitOfWork.UsuarioRepository.UpdateCompleteEspecialistAsync(userDb);
            await _unitOfWork.CommitAsync();
            return userToUpdate;
        }


        private async Task<bool> ValidateAlreadyCreatedUserEspecialist(Usuario nuevoUsuario)
        {
            bool exists = false;
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(nuevoUsuario.Id);
            if (usuario != null) exists = true;
            return exists;
        }

        public async Task<bool> UserActivation(int id, bool activacion)
        {
            //TODO Agregar columna activo
            Usuario usuario = await _unitOfWork.UsuarioRepository.GetByIdAsync(id);
            //usuario.Activo = activacion;
            _unitOfWork.UsuarioRepository.UpdateAsync(usuario);
            return true;
        }

        public async Task<Usuario> CreateAlreadyEspecialist(Usuario nuevoUsuario)
        {
            try
            {
                var user = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(nuevoUsuario.Id);
                if (user == null)
                {
                    throw new KeyNotFoundException($"El usuario con id {nuevoUsuario.Id} no existe");
                }
                user.Especialista = nuevoUsuario.Especialista;
                user.Rol = Roles.ESPECIALISTA;
                _unitOfWork.UsuarioRepository.UpdateAsync(user);
                await _unitOfWork.CommitAsync();
                _emailService.EnviarEmailCuentaCreada(user.Correo, user.Nombre);
                return user;

            }
            catch (Exception)
            {

                throw;
            }

        }

        public async Task<Usuario> UpdateClient(Usuario userToUpdate)
        {
            Usuario userDb = await _unitOfWork.UsuarioRepository.GetByIdAsync(userToUpdate.Id);
            if (userDb == null)
                throw new KeyNotFoundException($"No se encontro ningun usuario con el Id: {userToUpdate.Id}.");
            userToUpdate.Contrasenia = Encrypt.GetSHA256(userToUpdate.Contrasenia);

            UpdateClientMapper.mapUpdatedUser(userDb, userToUpdate);

            _unitOfWork.UsuarioRepository.UpdateAsync(userDb);
            await _unitOfWork.CommitAsync();
            return userToUpdate;
        }
    }
}
