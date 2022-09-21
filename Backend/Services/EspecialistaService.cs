using Core;
using Core.Services;
using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class EspecialistaService : IEspecialistaService
    {
        private readonly IUnitOfWork _unitOfWork;
        public EspecialistaService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<Especialista> CreateEspecialist(Especialista nuevoUsuario)
        {
            if (await ValidateAlreadyCreatedUserEspecialist(nuevoUsuario))
                throw new ArgumentException($"El Especialista con Documento: {nuevoUsuario.Documento} ya esta creado.");

            await _unitOfWork.EspecialistaRepository.CreateAsync(nuevoUsuario);
            await _unitOfWork.CommitAsync();
            return nuevoUsuario;
        }

        private async Task<bool> ValidateAlreadyCreatedUserEspecialist(Especialista nuevoUsuario)
        {
            bool exists = false;
            Especialista usuario = await _unitOfWork.EspecialistaRepository.GetEspecialistaByIdCompleteAsync(nuevoUsuario.Documento);
            if (usuario != null) exists = true;
            return exists;
        }
    }
}
