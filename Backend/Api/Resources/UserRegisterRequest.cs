namespace Api.Resources
{
    public class UserRegisterRequest
    {
        public string Documento { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string User { get; set; }
        public string Contrasenia { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public int IdDepartamento { get; set; }
    }
}
