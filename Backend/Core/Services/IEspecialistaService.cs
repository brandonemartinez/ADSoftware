using Core.Models;
using Dtos.Dto.Especialista;

namespace Core.Services
{
    public interface IEspecialistaService
    {
        Task<bool> AgregarDisponibilidad(string idDocumento, IEnumerable<Disponibilidad> disponibilidadRequest);
        Task<Especialista> CreateEspecialist(Especialista especialista);
        Task<IEnumerable<Especialista>> GetAll();
        Task<IEnumerable<Especialista>> GetListFiltred(ListFilter listFilter);
    }
}
