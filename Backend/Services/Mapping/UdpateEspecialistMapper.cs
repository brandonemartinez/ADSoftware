using Core.Models;

namespace Services.Mapping
{
    public static class UdpateEspecialistMapper
    {
        public static void MapEspecialistToUpdate(Usuario userOld, Usuario userNew)
        {
            foreach (var item in userNew.Especialista.OficioEspecialista)
            {
                userOld.Especialista.OficioEspecialista.Add(new OficioEspecialista
                {
                    IdEspecialista = item.IdEspecialista,
                    IdOficio = item.IdOficio
                });
            };
            mapUpdatedEspecialist(userOld.Especialista, userNew.Especialista);
            mapUpdatedUser(userOld, userNew);

        }

        private static void mapUpdatedEspecialist(Especialista espcialistOld, Especialista especialistNew)
        {
            espcialistOld.RazonSocial = especialistNew.RazonSocial;
            espcialistOld.Calificacion = especialistNew.Calificacion;
            espcialistOld.Fotos = especialistNew.Fotos;
            espcialistOld.IdPaquete = especialistNew.IdPaquete;
        }

        private static void mapUpdatedUser(Usuario userDb, Usuario userToUpdate)
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
