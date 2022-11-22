using Api.Resources.Client;
using FluentValidation;

namespace Api.Validators
{
    public class ClientUpdateRequestValidator : AbstractValidator<ClientUpdateRequest>
    {
        public ClientUpdateRequestValidator()
        {

        }
    }
}
