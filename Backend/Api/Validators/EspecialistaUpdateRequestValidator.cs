using Api.Resources.Especialist;
using FluentValidation;

namespace Api.Validators
{
    public class EspecialistaUpdateRequestValidator : AbstractValidator<EspecialistUpdateRequest>
    {
        public EspecialistaUpdateRequestValidator()
        {
            RuleFor(m => m.Contrasenia).MinimumLength(8).WithMessage("Contraseña debe tener mas de 8 caracteres.");
            RuleFor(m => m.Correo).EmailAddress().WithMessage("Correo no respeta el formato.");
            RuleFor(m => m.FechaNacimiento).NotNull().LessThanOrEqualTo(DateTime.Now.AddYears(-18)).WithMessage("El usuario debe ser mayor de edad.");
        }
    }
}
