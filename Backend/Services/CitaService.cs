using Core;
using Core.Models;
using Core.Services;
using Services.Constants;

namespace Services
{
    public class CitaService : ICitaService
    {
        private readonly IUnitOfWork _unitOfWork;

        public CitaService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<string> CreateCita(Cita cita, int idEspecialista, int idCliente)
        {
            var usuario = await _unitOfWork.UsuarioRepository.GetByIdAsync(idEspecialista);
            if (usuario == null)
            {
                throw new KeyNotFoundException($"No se encontro nignun especialista con el id: {idEspecialista}");
            }
            var cliente = await _unitOfWork.UsuarioRepository.GetByIdAsync(idCliente);
            if (cliente == null)
            {
                throw new KeyNotFoundException($"No se encontro nignun cliente con el id: {idEspecialista}");
            }
            cita.IdUsuarios.Add(usuario);
            cita.IdUsuarios.Add(cliente);
            cita.Estado = CitaStatus.SOLICITADA;
            await _unitOfWork.CitaRepository.CreateAsync(cita);
            var result = await _unitOfWork.CommitAsync();
            if (result != 0)
            {

                return "Cita creada";
            }
            else
            {
                throw new Exception($"No se pudo crear la cita");
            }

        }

        public async Task<IEnumerable<Cita>> GetById(int id)
        {
            IEnumerable<Cita> citas = await _unitOfWork.CitaRepository.GetAllById(id);
            return citas;
        }

        public async Task<string> UpdateStatus(int idCita, int idUsuario, string status)
        {
            Cita cita = await _unitOfWork.CitaRepository.GetByIdCompleteAsync(idCita);
            if (cita == null)
            {
                throw new KeyNotFoundException($"No se encontro una cita con el id {idCita}.");
            }
            
            if (!cita.IdUsuarios.Any(a => a.Id == idUsuario))
            {
                throw new Exception("Este usuario no esta relacionado con esta cita.");
            }

            switch (status.ToUpper())
            {
                case "ACEPTADA":
                    cita.Estado = CitaStatus.ACEPTADA;
                    break;
                case "CANCELADA":
                    cita.Estado = CitaStatus.CANCELADA;
                    break;
                case "RECHAZADA":
                    cita.Estado = CitaStatus.RECHAZADA;
                    break;
                case "FINALIZADA":
                    cita.Estado = CitaStatus.FINALIZADA;
                    break;
                default:
                    throw new Exception("Estado no válido");
            }
            _unitOfWork.CitaRepository.UpdateAsync(cita);
            var result = await _unitOfWork.CommitAsync();
            if (result != 0)
            {
                return "Cita actualizada";
            }
            else
            {
                throw new Exception("No se pudo actualizar la cita");
            }
        }
    }
}

