using Api.Resources.Usuario;
using FluentValidation;

namespace Api.Validators
{
    public class UsuarioRegisterRequestValidator : AbstractValidator<UsuarioRegisterRequest>
    {
        public UsuarioRegisterRequestValidator()
        {
            RuleFor(m => m.Nombre).NotEmpty().WithMessage("Nombre es requerido.");
            RuleFor(m => m.Apellido).NotEmpty().WithMessage("Apellido es requerido.");
            RuleFor(m => m.NombreUsuario).NotEmpty().WithMessage("Usuario es requerido.");
            RuleFor(m => m.Contrasenia).NotEmpty().WithMessage("Contraseña es requerido.");
            RuleFor(m => m.Correo).NotEmpty().WithMessage("Correo es requerido.");
            RuleFor(m => m.Direccion).NotEmpty().WithMessage("Direccion es requerida.");
            RuleFor(m => m.Telefono).NotEmpty().WithMessage("Telefono es requerido.");
            RuleFor(m => m.IdDepartamento).NotEmpty().WithMessage("Id Departamento es requerido.");
            RuleFor(m => m.FechaNacimiento).NotNull().LessThanOrEqualTo(DateTime.Now.AddYears(-18)).WithMessage("El usuario debe ser mayor de edad.");
        }
    }
}
