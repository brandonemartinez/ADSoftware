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
    public class PlanRepository : Repository<Paquete>, IPlanRepository
    {
        public PlanRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<Paquete> GetByName(string name)
        {
            return await DB_CATALOGO_SERVICIOSContext.Paquetes.FirstOrDefaultAsync(p => p.Nombre == name);
        }

    }
}