using System.ComponentModel.DataAnnotations;

namespace Api.Resources.Auth
{
    public class LoginData
    {
        [Required]
        public string Correo { get; set; }
        [Required]
        public string Contraseña { get; set; }
    }
}
