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
                    Certificaciones = item.Certificaciones,
                    Documento = item.Documento,
                    IdOficio = item.IdOficio
                });
            };
            mapUpdatedEspecialist(userOld.Especialista, userNew.Especialista);
            mapUpdatedUser(userOld, userNew);

        }

        private static void mapUpdatedEspecialist(Especialista espcialistOld, Especialista especialistNew)
        {
            //userDbEspecialist.Disponibilidads = userToUpdateEspecialist.Disponibilidads;
            espcialistOld.RazonSocial = especialistNew.RazonSocial;
            //espcialistOld.OficioEspecialista = especialistNew.OficioEspecialista;
            espcialistOld.Calificacion = especialistNew.Calificacion;
            espcialistOld.Fotos = especialistNew.Fotos;
            espcialistOld.IdPlanes = especialistNew.IdPlanes;
        }

        private static void mapUpdateOficioEspecialis(ICollection<OficioEspecialista> oficioEspecialistasOld, ICollection<OficioEspecialista> oficioEspecialistasNew)
        {
            oficioEspecialistasOld = oficioEspecialistasNew;
        }

        private static void mapUpdatedUser(Usuario userDb, Usuario userToUpdate)
        {
            userDb.Nombre = userToUpdate.Nombre;
            userDb.Apellido = userToUpdate.Apellido;
            userDb.User = userToUpdate.User;
            userDb.Correo = userToUpdate.Correo;
            userDb.Contrasenia = userToUpdate.Contrasenia;
            userDb.Telefono = userToUpdate.Telefono;
            userDb.Documento = userToUpdate.Documento;
            userDb.IdDepartamento = userToUpdate.IdDepartamento;
        }
    }
}
