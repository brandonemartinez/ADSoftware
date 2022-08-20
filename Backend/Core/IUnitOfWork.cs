using Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core
{
    public interface IUnitOfWork : IDisposable
    {
        IUsuarioRepository UsuarioRepository { get; }

        Task<int> CommitAsync();
        Task<int> CommitAsync(string eventType, string entityName, object entity);
    }
}
