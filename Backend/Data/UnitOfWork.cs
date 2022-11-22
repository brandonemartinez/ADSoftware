using Core;
using Core.Models;
using Core.Repositories;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public partial class UnitOfWork : IUnitOfWork
    {
        private readonly DB_CATALOGO_SERVICIOSContext _context;
        private UsuarioRepository _usuarioRepository;
        private EspecialistaRepository _especialistaRepository;
        private DepartamentoRepository _departamentoRepository;
        private CitaRepository _citaRepository;
        private OficioRepository _oficioRepository;
        private PlanRepository _planRepository;

        public UnitOfWork(DB_CATALOGO_SERVICIOSContext context)
        {
            this._context = context;
        }

        public IUsuarioRepository UsuarioRepository =>
            _usuarioRepository ??= new UsuarioRepository(_context);
        public IEspecialistaRepository EspecialistaRepository =>
            _especialistaRepository ??= new EspecialistaRepository(_context);
        public IDepartamentoRepository DepartamentoRepository =>
            _departamentoRepository ??= new DepartamentoRepository(_context);
        public ICitaRepository CitaRepository =>
            _citaRepository ??= new CitaRepository(_context);
        public IOficioRepository OficioRepository =>
            _oficioRepository ??= new OficioRepository(_context);
        public IPlanRepository PlanRepository =>
            _planRepository ??= new PlanRepository(_context);

        public void Dispose()
        {
            _context.Dispose();
        }

        public async Task<int> CommitAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public async Task<int> CommitAsync(string eventType, string entityName, object entity)
        {
            int result;
            await _context.Set<RegistroAuditoria>().AddAsync(new RegistroAuditoria(eventType, entityName, entity));
            result =  await _context.SaveChangesAsync();
            return result;

        }
    }
}
