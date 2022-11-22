using Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Mapping
{
    public static class UpdateClientMapper
    {
        public static void mapUpdatedUser(Usuario userDb, Usuario userToUpdate)
        {
            userDb.Nombre = userToUpdate.Nombre;
            userDb.Apellido = userToUpdate.Apellido;
            userDb.NombreUsuario = userToUpdate.NombreUsuario;
            userDb.Correo = userToUpdate.Correo;
            userDb.Contrasenia = userToUpdate.Contrasenia;
            userDb.Telefono = userToUpdate.Telefono;
            userDb.Id = userToUpdate.Id;
            userDb.IdDepartamento = userToUpdate.IdDepartamento;
        }
    }
}
