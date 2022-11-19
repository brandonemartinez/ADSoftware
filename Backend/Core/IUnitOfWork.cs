using Core.Repositories;

namespace Core
{
    public interface IUnitOfWork : IDisposable
    {
        IUsuarioRepository UsuarioRepository { get; }
        IEspecialistaRepository EspecialistaRepository { get; }
        IDepartamentoRepository DepartamentoRepository { get; }
        ICitaRepository CitaRepository { get; }
        IOficioRepository OficioRepository { get; }

        Task<int> CommitAsync();
        Task<int> CommitAsync(string eventType, string entityName, object entity);
    }
}
