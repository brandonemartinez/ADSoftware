﻿using Core.Models;
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

        public async Task<Especialista> GetEspecialistaByIdCompleteAsync(int id)
        {
            return await DB_CATALOGO_SERVICIOSContext.Especialista.FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task<IEnumerable<Especialista>> GetEspecialistasCompleteAsync()
        {
            return await DB_CATALOGO_SERVICIOSContext.Especialista.Include(e => e.IdNavigation).ToListAsync();
        }

        public async Task<IEnumerable<Especialista>> GetEspecialistaFilter(
            string Busqueda,
            string Localidad,
            decimal? Calificacion,
            decimal? CalificacionDesde,
            decimal? CalificacionHasta,
            string OrderBy,
            bool OrderByMethod)
        {
            var queryable = DB_CATALOGO_SERVICIOSContext.Especialista.Include(e => e.IdNavigation).Include(e => e.OficioEspecialista).AsQueryable();

            if (Busqueda != null)
            {
                queryable = queryable.Where(x => x.OficioEspecialista.Any(a => a.IdOficioNavigation.Nombre.Contains(Busqueda)) ||
                                                 x.NombreFantasia.Contains(Busqueda));
            };
            if (Calificacion.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion == Calificacion);
            }
            if (CalificacionDesde.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion >= CalificacionDesde);
            };
            if (CalificacionHasta.HasValue)
            {
                queryable = queryable.Where(x => x.Calificacion <= CalificacionHasta);
            };
            //Create a function to find by localidad
            if (Localidad != null)
            {
                queryable = queryable.Where(x => x.DepartamentoDisponible.Contains(Localidad));
            };

            queryable = OrderEspecialists(queryable, OrderBy, OrderByMethod);
            var oficios = await DB_CATALOGO_SERVICIOSContext.Oficios.ToListAsync();
            await queryable.ForEachAsync(item =>
            {
                foreach (var oficio in item.OficioEspecialista)
                {
                    oficio.IdOficioNavigation = new Oficio()
                    {
                        Id = oficio.IdOficio,
                        Nombre = oficios.FirstOrDefault(w => w.Id == oficio.IdOficio).Nombre
                    };
                }
            });

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
                        queryable = queryable.OrderBy(o => o.IdNavigation.Nombre);
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
                        queryable = queryable.OrderByDescending(o => o.IdNavigation.Nombre);
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
