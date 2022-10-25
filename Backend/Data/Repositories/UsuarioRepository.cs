using Core.Models;
using Core.Repositories;
using Microsoft.EntityFrameworkCore;

namespace Data.Repositories
{
    public partial class UsuarioRepository : Repository<Usuario>, IUsuarioRepository
    {
        public UsuarioRepository(DB_CATALOGO_SERVICIOSContext context) : base(context) { }

        private DB_CATALOGO_SERVICIOSContext DB_CATALOGO_SERVICIOSContext
        {
            get { return Context as DB_CATALOGO_SERVICIOSContext; }
        }

        public async Task<Usuario> GetEspecialistaByIdCompleteAsync(string documento)
        {
            return await DB_CATALOGO_SERVICIOSContext.Usuarios.Include(u => u.Especialista).Include(u => u.Especialista.OficioEspecialista).FirstOrDefaultAsync(u => u.Documento == documento);
        }

        public async Task<Usuario> GetClienteByIdCompleteAsync(string documento)
        {
            return await DB_CATALOGO_SERVICIOSContext.Usuarios.Include(u => u.Cliente).FirstOrDefaultAsync(u => u.Documento == documento);
        }

        public async Task<Usuario> GetClienteByIdOrEmailCompleteAsync(string documento, string correo)
        {
            return await DB_CATALOGO_SERVICIOSContext.Usuarios.Include(u => u.Cliente).FirstOrDefaultAsync(u => u.Documento == documento || u.Correo == correo);
        }
        public async void UpdateCompleteEspecialistAsync(Usuario? user)
        {
            try
            {
                var removeData = DB_CATALOGO_SERVICIOSContext.OficioEspecialistas.Where(w => w.Documento == user.Documento);
                DB_CATALOGO_SERVICIOSContext.OficioEspecialistas.RemoveRange(removeData);
                DB_CATALOGO_SERVICIOSContext.Especialista.Update(user.Especialista);
                DB_CATALOGO_SERVICIOSContext.Usuarios.Update(user);
            }
            catch (Exception exe)
            {

                throw exe;
            }
        }        
        public async void UpdateCompleteClientAsync(Usuario? user)
        {
            try
            {
                DB_CATALOGO_SERVICIOSContext.Clientes.Update(user.Cliente);
                DB_CATALOGO_SERVICIOSContext.Usuarios.Update(user);
            }
            catch (Exception exe)
            {

                throw exe;
            }
        }
    }
}
