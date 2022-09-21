using Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public interface IUsuarioService
    {
        Task<IEnumerable<Usuario>> GetAll();
        Task<Usuario> CreateEspecialist(Usuario usuario);
        Task<Usuario> CreateClient(Usuario usuario);

        Task<Usuario> GetById(string documento);
    }
}
