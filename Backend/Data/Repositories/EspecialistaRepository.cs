using Core.Models;
using Core.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Linq;

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
        public async Task<IEnumerable<Especialista>> GetEspecialistaFilter(string Nombre,
            string Apellido,
            string Oficio,
            decimal? Calificacion,
            string OrderBy,
            bool OrderByMethod)
        {


            var queryable = DB_CATALOGO_SERVICIOSContext.Especialista.Include(e => e.DocumentoNavigation).AsQueryable();
            if (!string.IsNullOrEmpty(Nombre))
            {
                queryable = queryable.Where(x => x.DocumentoNavigation.Nombre.Contains(Nombre));
            };
            if (!string.IsNullOrEmpty(Apellido))
            {
                queryable = queryable.Where(x => x.DocumentoNavigation.Apellido.Contains(Apellido));
            };
            if (!string.IsNullOrEmpty(Oficio))
            {
                queryable = queryable.Where(x => x.OficioEspecialista.Any(a => a.IdOficioNavigation.Nombre.Contains(Oficio)));
            };
            if (Calificacion.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion.Equals(Calificacion));
            };
            if (!string.IsNullOrEmpty(OrderBy))
            {
                //TODO OrderBy
                queryable = queryable.Where(x => x.DocumentoNavigation.Nombre.Contains(Nombre));
            };
            if (OrderByMethod)
            {
                //TODO OrderByMethod
                queryable = queryable.Where(x => x.DocumentoNavigation.Nombre.Contains(Nombre));
            };
            return queryable;
        }
    }
}
