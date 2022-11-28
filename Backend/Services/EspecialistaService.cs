using Core;
using Core.Models;
using Core.Services;
using Dtos.Dto.Especialista;
using Services.Constants;
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
                throw new InvalidOperationException($"El Especialista con Id: {nuevoUsuario.Id} ya esta creado.");

            await _unitOfWork.EspecialistaRepository.CreateAsync(nuevoUsuario);
            await _unitOfWork.CommitAsync();
            return nuevoUsuario;
        }

        private async Task<bool> ValidateAlreadyCreatedUserEspecialist(Especialista nuevoUsuario)
        {
            bool exists = false;
            Especialista usuario = await _unitOfWork.EspecialistaRepository.GetEspecialistaByIdCompleteAsync(nuevoUsuario.Id);
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
            IEnumerable<Especialista> especialistas = await _unitOfWork.EspecialistaRepository.GetEspecialistaFilter(listFilter.Busqueda,
                                                                                               listFilter.Localidad,
                                                                                               listFilter.Calificacion,
                                                                                               listFilter.CalificacionDesde,
                                                                                               listFilter.CalificacionHasta,
                                                                                               listFilter.OrderBy,
                                                                                               listFilter.OrderByMethod);
            //TODO Audotoria de busqueda
            //var test = especialistas.Count();
            //if(especialistas.Count() == 0)
            //{
            //    await _unitOfWork.CommitAsync(EventTypes.SEARCH, TablesName.ESPECIALISTA, listFilter);
            //}
            return especialistas;
        }

        public async Task<Especialista> GetById(int idEspecialista)
        {
            var especialista = await _unitOfWork.EspecialistaRepository.GetEspecialistaByIdCompleteAsync(idEspecialista);
            return especialista;
        }        
        public async Task<Usuario> GetDetailById(int idEspecialista)
        {
            var especialista = await _unitOfWork.UsuarioRepository.GetEspecialistaByIdCompleteAsync(idEspecialista);
            return especialista;
        }
    }
}
