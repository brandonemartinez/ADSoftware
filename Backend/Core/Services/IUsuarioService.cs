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
        Task<Usuario> GetById(string documento);
        Task<IEnumerable<Usuario>> GetAll();
        Task<Usuario> Create(Usuario usuario);
    }
}
