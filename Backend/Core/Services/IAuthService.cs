namespace Core.Services
{
    public interface IAuthService
    {
        Task<string> Auth(string correo, string contraseña);
    }
}
