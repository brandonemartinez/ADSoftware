using Core.Models;

namespace Services.Mapping
{
    public static class UpdateClientMapper
    {
        public static void mapUpdatedUser(Usuario userDb, Usuario userToUpdate)
        {
            if (userToUpdate.Nombre != null)
                userDb.Nombre = userToUpdate.Nombre;
            if (userToUpdate.Apellido != null)
                userDb.Apellido = userToUpdate.Apellido;
            if (userToUpdate.NombreUsuario != null)
                userDb.NombreUsuario = userToUpdate.NombreUsuario;
            if (userToUpdate.Contrasenia != null)
                userDb.Contrasenia = userToUpdate.Contrasenia;
            if (userToUpdate.Correo != null)
                userDb.Correo = userToUpdate.Correo;
            if (userToUpdate.Telefono != null)
                userDb.Telefono = userToUpdate.Telefono;
            if (userToUpdate.Direccion != null)
                userDb.Direccion = userToUpdate.Direccion;
            if (userToUpdate.FechaNacimiento != null)
                userDb.FechaNacimiento = userToUpdate.FechaNacimiento;
            if (userToUpdate.Genero != null)
                userDb.Genero = userToUpdate.Genero;
            if (userToUpdate.IdDepartamento != 0)
                userDb.IdDepartamento = userToUpdate.IdDepartamento;
        }
    }
}
