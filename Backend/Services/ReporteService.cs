using Core;
using Core.Models;
using Core.Services;
using Dtos.Dto.Cita;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class ReporteService : IReporteService
    {
        private readonly IUnitOfWork _unitOfWork;

        public ReporteService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<Tuple<int, IEnumerable<Cita>>> GetServiciosContratados(int pagina)
        {
            return await _unitOfWork.CitaRepository.GetAllPaginated(pagina);
            
        }
    }
}
