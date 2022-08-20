using Core.Repositories;
using Data.Models;
using Microsoft.EntityFrameworkCore;

namespace Data.Repositories
{
    public partial class UsuarioRepository : Repository<Usuario>, IUsuarioRepository
    {
        public UsuarioRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }
    }
}
