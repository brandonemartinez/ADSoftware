using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public interface IPagoService
    {
        Task<string> RegistrarPagoCita(int idCita, bool pago, int idUsuario);
        Task<string> RegistrarPagoPlan(int idPlan, bool pago, int idUsuario, bool anual);
    }
}
