using Core.Models;

namespace Services.Mapping
{
    public static class UpdateClientMapper
    {
        public static void mapUpdatedUser(Usuario userDb, Usuario userToUpdate)
        {
            if (!String.IsNullOrWhiteSpace(userToUpdate.Nombre))
                userDb.Nombre = userToUpdate.Nombre;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Apellido))
                userDb.Apellido = userToUpdate.Apellido;
            if (!String.IsNullOrWhiteSpace(userToUpdate.NombreUsuario))
                userDb.NombreUsuario = userToUpdate.NombreUsuario;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Contrasenia))
                userDb.Contrasenia = userToUpdate.Contrasenia;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Correo))
                userDb.Correo = userToUpdate.Correo;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Telefono))
                userDb.Telefono = userToUpdate.Telefono;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Direccion))
                userDb.Direccion = userToUpdate.Direccion;
            if (userToUpdate.FechaNacimiento != null)
                userDb.FechaNacimiento = userToUpdate.FechaNacimiento;
            if (!String.IsNullOrWhiteSpace(userToUpdate.Genero))
                userDb.Genero = userToUpdate.Genero;
            if (userToUpdate.IdDepartamento != 0)
                userDb.IdDepartamento = userToUpdate.IdDepartamento;
        }
    }
}
