using Core.Models;
using Core.Repositories;

namespace Data.Repositories
{
    public class DisponibilidadRepository : Repository<Disponibilidad>, IDisponibilidadRepository
    {
        public DisponibilidadRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }
    }
}
