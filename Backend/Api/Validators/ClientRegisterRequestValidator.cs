using Api.Resources.Client;
using FluentValidation;
using System.Reflection.Metadata;

namespace Api.Validators
{
    public class ClientRegisterRequestValidator : AbstractValidator<ClientRegisterRequest>
    {
        public ClientRegisterRequestValidator()
        {
            RuleFor(m => m.Documento).NotEmpty().WithMessage("Documento es requerido.");
            RuleFor(m => m.Documento)
            .Must((documento) => 
            {
                return CedulaValidator.Validate(documento); 
            }).WithMessage("Documento es invalido.");
            RuleFor(m => m.Nombre).NotEmpty().WithMessage("Nombre es requerido.");
            RuleFor(m => m.Apellido).NotEmpty().WithMessage("Apellido es requerido.");
            RuleFor(m => m.User).NotEmpty().WithMessage("Usuario es requerido.");
            RuleFor(m => m.Contrasenia).NotEmpty().WithMessage("Contraseña es requerido.");
            RuleFor(m => m.Correo).NotEmpty().WithMessage("Correo es requerido.");
            RuleFor(m => m.Telefono).NotEmpty().WithMessage("Telefono es requerido.");
            RuleFor(m => m.IdDepartamento).NotEmpty().WithMessage("Id Departamento es requerido.");

        }
    }
}
