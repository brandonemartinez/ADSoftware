using Core;
using Core.Models;
using Core.Services;

namespace Services
{
    public class PlanService : IPlanService
    {
        private readonly IUnitOfWork _unitOfWork;
        public PlanService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<bool> Create(Paquete plan)
        {
            try
            {
                var existe = await _unitOfWork.PlanRepository.GetByName(plan.Nombre);
                if (existe != null)
                {
                    throw new InvalidOperationException($"Ya existe un plan con el nombre {plan.Nombre}.");
                }
                await _unitOfWork.PlanRepository.CreateAsync(plan);
                var result = await _unitOfWork.CommitAsync();
                return true;
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }

        public async Task<IEnumerable<Paquete>> GetAll()
        {
            try
            {
                IEnumerable<Paquete> paquetes = await _unitOfWork.PlanRepository.GetAllAsync();
                return paquetes;
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }

        public async Task<Paquete> GetById(int idPlan)
        {
            try
            {
                Paquete plan = await _unitOfWork.PlanRepository.GetByIdAsync(idPlan);
                return plan;
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }
    }
}
