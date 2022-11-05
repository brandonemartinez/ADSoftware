using Core;
using Core.Models;
using Core.Services;
using Services.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

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
            if(usuario == null)
            {
                throw new Exception($"No se encontro nignun especialista con el id: {idEspecialista}");
            }
            var cliente = await _unitOfWork.UsuarioRepository.GetByIdAsync(idCliente);
            if(cliente == null)
            {
                throw new Exception($"No se encontro nignun cliente con el id: {idEspecialista}");
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
    }
}
