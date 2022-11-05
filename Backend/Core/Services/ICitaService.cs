using Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public interface ICitaService
    {
        Task<string> CreateCita(Cita cita, int idEspecialista, int idCliente);
        Task<IEnumerable<Cita>> GetById(int clienteId);
    }
}
