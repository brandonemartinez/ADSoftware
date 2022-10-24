using Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Repositories
{
    public partial interface IDepartamentoRepository : IRepository<Departamento>
    {
        Task<IEnumerable<Departamento>> GetDepartamentoCompleteAsync();
    }
}
