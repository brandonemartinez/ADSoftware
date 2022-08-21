using Api.Resources;
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
        private readonly IUsuarioService _userservice;
        private readonly IMapper _mapper;

        public UsuarioController(IUsuarioService userservice
            , IMapper mapper
            )
        {
            _userservice = userservice;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserResourceResponse>> GetById(string id)
        {
            if (string.IsNullOrWhiteSpace(id)) return BadRequest($"El id no es valida");
            Usuario user = await _userservice.GetById(id);
            if(user == null) return NotFound($"No se encontro un usuario con la id {id}");
            UserResourceResponse  response = _mapper.Map<Usuario, UserResourceResponse>(user);
            return Ok(response);
        }

        [HttpPost("Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserResourceResponse>> CreateEspecialista([FromBody] UserRegisterRequest userRegisterRequest)
        {
            var validator = new UserRegisterRequestValidator();
            var validatorResult = await validator.ValidateAsync(userRegisterRequest);
            if (!validatorResult.IsValid)
                return BadRequest(validatorResult.Errors);

            var userToCreate = _mapper.Map<UserRegisterRequest, Usuario>(userRegisterRequest);
            Usuario newUser = await _userservice.Create(userToCreate);
            Usuario user = await _userservice.GetById(newUser.Documento);
            UserResourceResponse response = _mapper.Map<Usuario, UserResourceResponse>(user);
            return Created("Created", response);
        }

        [HttpPost("Cliente")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserResourceResponse>> CreateCliente([FromBody] UserRegisterRequest userRegisterRequest)
        {
            var validator = new UserRegisterRequestValidator();
            var validatorResult = await validator.ValidateAsync(userRegisterRequest);
            if (!validatorResult.IsValid)
                return BadRequest(validatorResult.Errors);

            var userToCreate = _mapper.Map<UserRegisterRequest, Usuario>(userRegisterRequest);
            Usuario newUser = await _userservice.Create(userToCreate);
            Usuario user = await _userservice.GetById(newUser.Documento);
            UserResourceResponse response = _mapper.Map<Usuario, UserResourceResponse>(user);
            return Created("Created", response);
        }

    }
}
