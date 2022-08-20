using Api.Resources;
using FluentValidation;

namespace Api.Validators
{
    public class UserRegisterRequestValidator : AbstractValidator<UserRegisterRequest>
    {
        public UserRegisterRequestValidator()
        {
            RuleFor(m => m.Documento).NotEmpty().WithMessage("Documento es requerido");
            RuleFor(m => m.Nombre).NotEmpty().WithMessage("Nombre es requerido");
            RuleFor(m => m.Apellido).NotEmpty().WithMessage("Apellido es requerido");
            RuleFor(m => m.User).NotEmpty().WithMessage("Usuario es requerido");
            RuleFor(m => m.Contrasenia).NotEmpty().WithMessage("Contraseña es requerido");
            RuleFor(m => m.Correo).NotEmpty().WithMessage("Correo es requerido");
            RuleFor(m => m.Telefono).NotEmpty().WithMessage("Telefono es requerido");
            RuleFor(m => m.IdDepartamento).NotEmpty().WithMessage("Id Departamento es requerido");

        }
    }
}
