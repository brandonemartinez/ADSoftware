using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Repositories
{
    public partial interface IRepository<TEntity> where TEntity : class
    {
        Task CreateAsync(TEntity entity);
        Task<IEnumerable<TEntity>> GetAllAsync();
        ValueTask<TEntity> GetByStringIdAsync(string id);
        void UpdateAsync(TEntity entity);
        //ValueTask DeleteAsync(TEntity entity);
        //ValueTask<TEntity> GetByIntIdAsync(string id);
    }
}
