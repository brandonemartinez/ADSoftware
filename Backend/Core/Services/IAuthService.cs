namespace Core.Services
{
    public interface IArchivoService
    {
        Task Create(byte[] archivo, int idEspecialista, bool fotoPerfil);
    }
}
