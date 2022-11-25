﻿using Core.Models;
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
            return await DB_CATALOGO_SERVICIOSContext.Cita.Include("IdUsuarios").FirstOrDefaultAsync(s => s.Id == id);
        }
    }
}
