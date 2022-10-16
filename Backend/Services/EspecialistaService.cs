using Core;
using Core.Models;
using Core.Services;
using Dtos.Dto.Especialista;
using System.Linq.Dynamic.Core;

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

        public async Task<IEnumerable<Especialista>> GetAll()
        {

            var especialistas = await _unitOfWork.EspecialistaRepository.GetEspecialistasCompleteAsync();
            return especialistas;
        }

        public async Task<IEnumerable<Especialista>> GetListFiltred(ListFilter listFilter)
        {
            IEnumerable<Especialista> especialistas = await _unitOfWork.EspecialistaRepository.GetEspecialistaFilter(listFilter.Nombre,
                                                                                               listFilter.Apellido,
                                                                                               listFilter.Oficio,
                                                                                               listFilter.Calificacion,
                                                                                               listFilter.OrderBy,
                                                                                               listFilter.OrderByMethod);
            return especialistas;
        }
    }
}
