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
    public class ArchivoRepository : Repository<Archivo>, IArchivoRepository
    {
        public ArchivoRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<Archivo> GetByEspecialistaId(int idEspecialista)
        {

            return await DB_CATALOGO_SERVICIOSContext.Archivos.FirstOrDefaultAsync(a => a.IdEspecialista == idEspecialista && a.FotoPerfil == true);
        }
    }
}
