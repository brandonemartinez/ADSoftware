using Api.Resources.Client;
using Api.Resources.Especialist;
using Api.Validators;
using AutoMapper;
using Core.Services;
using Data.Models;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;
        private readonly IEspecialistaService _especialistaService;
        private readonly IMapper _mapper;

        public UsuarioController(IUsuarioService userservice,
                                 IMapper mapper)
        {
            _usuarioService = userservice;
            _mapper = mapper;
        }

        [HttpPost("Cliente")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ClientResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ClientResourceResponse>> CreateCliente([FromBody] ClientRegisterRequest userRegisterRequest)
        {
            try
            {
                var validator = new ClientRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                var userToCreate = _mapper.Map<ClientRegisterRequest, Usuario>(userRegisterRequest);
                Usuario newUser = await _usuarioService.CreateClient(userToCreate);
                Usuario user = await _usuarioService.GetById(newUser.Documento);
                ClientResourceResponse response = _mapper.Map<Usuario, ClientResourceResponse>(user);
                return Created("Created", response);
            }
            catch
            {
                throw;
            }
        }

        [HttpPost("Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(EspecialistResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<EspecialistResourceResponse>> CreateEspecialista([FromBody] EspecialistRegisterRequest userRegisterRequest)
        {
            try
            {
                var validator = new EspecialistRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                var userToCreate = _mapper.Map<EspecialistRegisterRequest, Usuario>(userRegisterRequest);
                Usuario newUser = await _usuarioService.CreateEspecialist(userToCreate);
                Usuario user = await _usuarioService.GetById(newUser.Documento);
                if (user == null) return NotFound();
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(user);
                return Created("Created", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }

        [HttpPost("Creado/Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(EspecialistResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<EspecialistResourceResponse>> CreatedUsuarioEspecialista([FromBody] EspecialistRegisterRequest userRegisterRequest)
        {
            try
            {
                var validator = new EspecialistRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                var userToCreate = _mapper.Map<EspecialistRegisterRequest, Usuario>(userRegisterRequest);
                Especialista newUser = await _especialistaService.CreateEspecialist(userToCreate.Especialista);
                Usuario user = await _usuarioService.GetById(newUser.Documento);
                if (user == null) return NotFound();
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(user);
                return Created("Created", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }

    }
}
