using Core.Models;
using Dtos.Dto.Especialista;

namespace Core.Services
{
    public interface IEspecialistaService
    {
        //Task<bool> AgregarDisponibilidad(int idUsuario, IEnumerable<Disponibilidad> disponibilidadRequest);
        Task<Especialista> CreateEspecialist(Especialista especialista);
        Task<IEnumerable<Especialista>> GetAll();
        Task<Especialista> GetById(int idEspecialista);
        Task<IEnumerable<Especialista>> GetListFiltred(ListFilter listFilter);
    }
}
