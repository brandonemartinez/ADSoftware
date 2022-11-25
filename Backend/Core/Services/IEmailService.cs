using Core.Models;

namespace Core.Services
{
    public interface IEmailService
    {
        void EnviarEmailCuentaCreada(string email, string nombre);
        void CambioEstadoACliente(Cita cita, string estado);
        void CambioEstadoAEspecialista(Cita cita, string estado);
    }
}
