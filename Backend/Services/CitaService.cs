using Core;
using Core.Models;
using Core.Services;
using Services.Constants;

namespace Services
{
    public class CitaService : ICitaService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IDisponibilidadService _disponibilidadService;
        private readonly IEmailService _emailService;

        public CitaService(IUnitOfWork unitOfWork, IDisponibilidadService disponibilidadService, IEmailService emailService)
        {
            _unitOfWork = unitOfWork;
            _disponibilidadService = disponibilidadService;
            _emailService = emailService;
        }

        public async Task<string> CreateCita(Cita cita, int idEspecialista, int idCliente)
        {
            var especialista = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(idEspecialista);
            if (especialista == null)
            {
                throw new KeyNotFoundException($"No se encontro nignun especialista con el id: {idEspecialista}");
            }

            var cliente = await _unitOfWork.UsuarioRepository.GetByIdAsync(idCliente);
            if (cliente == null)
            {
                throw new KeyNotFoundException($"No se encontro nignun cliente con el id: {idEspecialista}");
            }

            var disponibilidad = await _disponibilidadService.ValidarDisponibilidad(especialista.Especialista, cita);
            if (!disponibilidad)
            {
                throw new InvalidOperationException("El especialista no esta disponible en ese horario.");
            }

            cita.IdUsuarios.Add(especialista);
            cita.IdUsuarios.Add(cliente);
            cita.IdCliente = idCliente;
            cita.IdEspecialista = idEspecialista;
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

        public async Task<IEnumerable<Cita>> GetCitasAgenda(int id)
        {
            IEnumerable<Cita> citas = await _unitOfWork.CitaRepository.GetAllByEspecialistaId(id);
            return citas;
        }
        public async Task<IEnumerable<Cita>> GetSolicitudes(int id)
        {
            IEnumerable<Cita> citas = await _unitOfWork.CitaRepository.GetAllByClienteId(id);
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

            if (cita.Estado == CitaStatus.RECHAZADA || cita.Estado == CitaStatus.ACEPTADA)
            {
                _emailService.CambioEstadoACliente(cita, cita.Estado);
            }
            if (cita.Estado == CitaStatus.CANCELADA)
            {
                _emailService.CambioEstadoAEspecialista(cita, cita.Estado);
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

