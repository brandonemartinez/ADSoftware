using Core.Models;
using Core.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Repositories
{
    public class CitaRepository : Repository<Cita>, ICitaRepository
    {
        public CitaRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<IEnumerable<Cita>> GetAllByClienteId(int id)
        {
            return await DB_CATALOGO_SERVICIOSContext.Cita.Where(e => e.IdCliente == id).ToListAsync();
        }

        public async Task<IEnumerable<Cita>> GetAllByEspecialistaId(int id)
        {
            return await DB_CATALOGO_SERVICIOSContext.Cita.Where(e => e.IdEspecialista == id).ToListAsync();
        }

        public async Task<IEnumerable<Cita>> GetAllById(int id)
        {
            var queryable = DB_CATALOGO_SERVICIOSContext.Cita.Include(e => e.IdUsuarios).AsQueryable();
            queryable = queryable.Where(w => w.IdUsuarios.Any(a => a.Id == id));
            return queryable;
        }        
        
        public async Task<Cita> GetByIdCompleteAsync(int id)
        {
            return await DB_CATALOGO_SERVICIOSContext.Cita.Include(i => i.IdUsuarios).FirstOrDefaultAsync(s => s.Id == id);
        }

        public async Task<Tuple<int, IEnumerable<Cita>>> GetAllPaginated(int pagina)
        {
            if (pagina == 0)
                pagina = 1;
            
            var skip = (pagina - 1) * 20;
            var citas = await DB_CATALOGO_SERVICIOSContext.Cita.ToListAsync();
            var cantidad = citas.Count();
            var citasFiltradas = citas.OrderByDescending(o => o.Fecha).Skip(skip).Take(20);
            return new Tuple<int, IEnumerable<Cita>>(cantidad, citasFiltradas);
        }
    }
}
