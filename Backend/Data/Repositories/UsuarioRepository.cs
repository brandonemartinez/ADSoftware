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

        public async Task<Usuario> GetByCorreo(string correo)
        {
            return await DB_CATALOGO_SERVICIOSContext.Usuarios.Where(w => w.Correo == correo).FirstOrDefaultAsync();
        }

        public async Task<Usuario> GetEspecialistaByIdCompleteAsync(int id)
        {
            //TODO Validate
            return await DB_CATALOGO_SERVICIOSContext.Usuarios.Include(u => u.Especialista).Include(u => u.Especialista.IdOficios).FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task<Usuario> GetUsuarioLoginAsync(string correo, string contrasenia) => await DB_CATALOGO_SERVICIOSContext.Usuarios.Where(w => w.Correo == correo && w.Contrasenia == contrasenia).FirstOrDefaultAsync();
        public void UpdateCompleteEspecialistAsync(Usuario? user)
        {
            try
            {
                //TODO Validate
                //var removeData = DB_CATALOGO_SERVICIOSContext.OficioEspecialista.Where(w => w.IdEspecialista == user.Id);
                //DB_CATALOGO_SERVICIOSContext.OficioEspecialista.RemoveRange(removeData);
                DB_CATALOGO_SERVICIOSContext.Especialista.Update(user.Especialista);
                DB_CATALOGO_SERVICIOSContext.Usuarios.Update(user);
            }
            catch (Exception exe)
            {

                throw new Exception(exe.Message);
            }
        } 
    }
}
