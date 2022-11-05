namespace Core.Repositories
{
    public partial interface IRepository<TEntity> where TEntity : class
    {
        Task CreateAsync(TEntity entity);
        Task CreateRangeAsync(IEnumerable<TEntity> entity);
        Task<IEnumerable<TEntity>> GetAllAsync();
        ValueTask<TEntity> GetByIdAsync(int id);
        void UpdateAsync(TEntity entity);
        //ValueTask DeleteAsync(TEntity entity);
        //ValueTask<TEntity> GetByIntIdAsync(string id);
    }
}
