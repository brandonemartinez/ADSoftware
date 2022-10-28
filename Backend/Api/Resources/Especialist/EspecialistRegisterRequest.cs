using Dtos.Dto.Especialista;

namespace Api.Resources.Especialist
{
    public class EspecialistRegisterRequest
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string User { get; set; }
        public string Contrasenia { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public int IdDepartamento { get; set; }
        public string RazonSocial { get; set; }
        public string Fotos { get; set; }
        public int? Calificacion { get; set; }
        public int IdPlanes { get; set; }
        public List<OficioEspecialistaDto> Oficios { get; set; }

    }
}
