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
            string Oficio,
            string Localidad,
            decimal? CalificacionDesde,
            decimal? CalificacionHasta,
            string OrderBy,
            bool OrderByMethod)
        {
            var queryable = DB_CATALOGO_SERVICIOSContext.Especialista.Include(e => e.DocumentoNavigation).AsQueryable();
            if (!string.IsNullOrEmpty(Nombre))
            {
                queryable = queryable.Where(x => x.DocumentoNavigation.Nombre.Contains(Nombre));
            };
            if (!string.IsNullOrEmpty(Oficio))
            {
                queryable = queryable.Where(x => x.OficioEspecialista.Any(a => a.IdOficioNavigation.Nombre.Contains(Oficio)));
            };
            //if (!string.IsNullOrEmpty(Localidad))
            //{
            //    queryable = queryable.Where(x => x.OficioEspecialista.Any(a => a.IdOficioNavigation.Nombre == Oficio));
            //};
            if (CalificacionDesde.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion >= CalificacionDesde);
            };
            if (CalificacionHasta.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion <= CalificacionHasta);
            };
            
            queryable = OrderEspecialists(queryable, OrderBy, OrderByMethod);
            return queryable;
        }

        private IQueryable<Especialista> OrderEspecialists(IQueryable<Especialista> queryable, string orderBy, bool orderByMethod)
        {
            if (string.IsNullOrEmpty(orderBy))
            {
                queryable = queryable.OrderBy(o => o.Calificacion);
            }
            else
            {
                if (orderByMethod)
                {
                    if (orderBy == "Nombre")
                    {
                        queryable = queryable.OrderBy(o => o.DocumentoNavigation.Nombre);
                    }
                    if (orderBy == "Oficio")
                    {
                        queryable = queryable.OrderBy(o => o.OficioEspecialista);
                    }
                    if (orderBy == "Calificacion")
                    {
                        queryable = queryable.OrderBy(o => o.Calificacion);
                    }
                }
                else
                {
                    if (orderBy == "Nombre")
                    {
                        queryable = queryable.OrderByDescending(o => o.DocumentoNavigation.Nombre);
                    }
                    if (orderBy == "Oficio")
                    {
                        queryable = queryable.OrderByDescending(o => o.OficioEspecialista);
                    }
                    if (orderBy == "Calificacion")
                    {
                        queryable = queryable.OrderByDescending(o => o.Calificacion);
                    }

                }
            }
            return queryable;
        }
    }
}
