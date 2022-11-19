using Core;
using Core.Services;
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

        //public async Task<IEnumerable<Reporte>> GetReporteByEspecialista(int idEspecialista)
        //{
        //    var reportes = await _unitOfWork.Reportes.GetAllById(idEspecialista);
        //    return reportes;
        //}

        //public async Task<IEnumerable<Reporte>> GetReporteByCliente(int idCliente)
        //{
        //    var reportes = await _unitOfWork.Reportes.GetAllById(idCliente);
        //    return reportes;
        //}

        //public async Task<string> CreateReporte(Reporte reporte, int idEspecialista, int idCliente)
        //{
        //    try
        //    {
        //        await _unitOfWork.Reportes.Add(reporte);
        //        await _unitOfWork.CommitAsync();
        //        return "Reporte creado correctamente";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}

        //public async Task<string> UpdateReporte(Reporte reporte, int idEspecialista, int idCliente)
        //{
        //    try
        //    {
        //        _unitOfWork.Reportes.Update(reporte);
        //        await _unitOfWork.CommitAsync();
        //        return "Reporte actualizado correctamente";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}

        //public async Task<string> DeleteReporte(int idReporte)
        //{
        //    try
        //    {
        //        var reporte = await _unitOfWork.Reportes.GetById(idReporte);
        //        _unitOfWork.Reportes.Remove(reporte);
        //        await _unitOfWork.CommitAsync();
        //        return "Reporte eliminado correctamente";
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.Message;
        //    }
        //}
    }
}
