using Core.Models;
using Core.Repositories;
using Microsoft.EntityFrameworkCore;

namespace Data.Repositories
{
    public class OficioRepository : Repository<Oficio>, IOficioRepository
    {
        public OficioRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<Oficio> GetByName(string nombre)
        {
            return await DB_CATALOGO_SERVICIOSContext.Oficios.FirstOrDefaultAsync(o => o.Nombre == nombre);
        }
    }
}
