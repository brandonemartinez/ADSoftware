using Core;
using Core.Models;
using Core.Services;
using Services.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class PagoService : IPagoService
    {
        private readonly IUnitOfWork _unitOfWork;
        public PagoService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        //TODO
        public async Task<string> RegistrarPagoCita(int idCita, bool pago, int idUsuario)
        {
            var response = "";
            Cita cita = await _unitOfWork.CitaRepository.GetByIdAsync(idCita);

            if (cita != null && cita.IdCliente == idUsuario)
            {
                if (pago)
                {
                    cita.EstadoPago = PaymentStatus.PAGADO;
                    _unitOfWork.CitaRepository.UpdateAsync(cita);
                    var result = await _unitOfWork.CommitAsync();
                    if (result > 0)
                    {
                        response = "Se ha registrado el pago de la cita.";
                    }

                    return response;

                }
                else
                {
                    return response;
                }

            }
            else
            {
                return response;
            }

        }

        public async Task<string> RegistrarPagoPlan(int idPlan, bool pago, int idUsuario, bool anual = false)
        {
            Paquete plan = await _unitOfWork.PlanRepository.GetByIdAsync(idPlan);
            Especialista especialista = await _unitOfWork.EspecialistaRepository.GetByIdAsync(idUsuario);
            var response = "";
            if (plan != null && especialista != null)
            {
                if (pago)
                {
                    especialista.IdPaquete = plan.Id;
                    if (anual)
                    {
                        especialista.ExpiracionPlan = DateTime.Now.AddYears(1);
                    }
                    else
                    {
                        especialista.ExpiracionPlan = DateTime.Now.AddMonths(1);
                    }
                    _unitOfWork.EspecialistaRepository.UpdateAsync(especialista);
                    var result = await _unitOfWork.CommitAsync();
                    if (result > 0)
                    {
                        response = "Se ha registrado el pago del plan.";

                    }
                    return response;
                }
                else
                {
                    return response;
                }
            }
            else
            {
                return response;
            }
        }
    }
}
