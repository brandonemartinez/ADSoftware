using Core;
using Core.Models;
using Core.Repositories;
using Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class DepartamentoService : IDepartamentoService
    {
        private readonly IUnitOfWork _unitOfWork;
        public DepartamentoService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public async Task<IEnumerable<Departamento>> GetAll()
        {
            var departamentos = await _unitOfWork.DepartamentoRepository.GetDepartamentoCompleteAsync();
            return departamentos;
        }
    }
}
