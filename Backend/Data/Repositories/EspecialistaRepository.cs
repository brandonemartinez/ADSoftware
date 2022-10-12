using Core.Models;
using Core.Repositories;
using Microsoft.EntityFrameworkCore;

namespace Data.Repositories
{
    internal class EspecialistaRepository : Repository<Especialista>, IEspecialistaRepository
    {

        public EspecialistaRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<Especialista> GetEspecialistaByIdCompleteAsync(string documento)
        {
            return await DB_CATALOGO_SERVICIOSContext.Especialista.FirstOrDefaultAsync(u => u.Documento == documento);
        }

        public async Task<IEnumerable<Especialista>> GetEspecialistasCompleteAsync()
        {
            return await DB_CATALOGO_SERVICIOSContext.Especialista.Include(e => e.DocumentoNavigation).ToListAsync();
        }
    }
}
