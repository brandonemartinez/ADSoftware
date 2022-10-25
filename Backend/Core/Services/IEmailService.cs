namespace Core.Services
{
    public interface IEmailService
    {
        void EnviarEmailCuentaCreada(string email, string nombre);
    }
}
