using Core;
using Core.Models;
using Core.Services;

namespace Services
{
    public class OficioService : IOficioService
    {
        private readonly IUnitOfWork _unitOfWork;
        public OficioService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> CreateOficio(Oficio oficio)
        {
            try
            {
                Oficio exist = await _unitOfWork.OficioRepository.GetByName(oficio.Nombre);
                if (exist != null)
                    throw new InvalidOperationException($"Ya existe un oficio con el nombre {oficio.Nombre}.");

                await _unitOfWork.OficioRepository.CreateAsync(oficio);
                var result = await _unitOfWork.CommitAsync();
                return true;
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }

        }

        public async Task<bool> EliminarOficio(int id)
        {
            Oficio oficio = await _unitOfWork.OficioRepository.GetByIdAsync(id);
            if(oficio != null)
            {
                await _unitOfWork.OficioRepository.DeleteAsync(oficio);
                var result = await _unitOfWork.CommitAsync();
                if (result > 0)
                    return true;
                else
                    return false;
            }
            return false;
        }

        public async Task<IEnumerable<Oficio>> GetAll()
        {
            try
            {
                IEnumerable<Oficio> oficios = await _unitOfWork.OficioRepository.GetAllAsync();
                return oficios.OrderBy(o => o.Nombre);
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }
    }
}
