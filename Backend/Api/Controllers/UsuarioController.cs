using Api.Resources.Especialist;
using Api.Resources.Usuario;
using Api.Validators;
using AutoMapper;
using Core.Models;
using Core.Services;
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
                                 IEspecialistaService especialistaService,
                                 IMapper mapper)
        {
            _especialistaService = especialistaService;
            _usuarioService = userservice;
            _mapper = mapper;
        }

        /// <summary>
        /// Registro de Cliente
        /// </summary>
        /// <param name="userRegisterRequest"></param>
        /// <returns></returns>
        [HttpPost("Cliente")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(UsuarioRegisterResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<UsuarioRegisterResponse>> CreateClient([FromBody] UsuarioRegisterRequest userRegisterRequest)
        {
            try
            {
                var validator = new UsuarioRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                //Mapper
                var userToCreate = _mapper.Map<UsuarioRegisterRequest, Usuario>(userRegisterRequest);

                Usuario usuario = await _usuarioService.CreateUsuario(userToCreate);
                UsuarioRegisterResponse response = _mapper.Map<Usuario, UsuarioRegisterResponse>(usuario);
                return Created("Created", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }

        /// <summary>
        /// Crear un Especialista
        /// </summary>
        /// <param name="userRegisterRequest"></param>
        /// <returns></returns>
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

                //Mapper
                var userToCreate = _mapper.Map<EspecialistRegisterRequest, Usuario>(userRegisterRequest);
                userRegisterRequest.Oficios.ForEach(f => userToCreate.Especialista.OficioEspecialista.Add(new OficioEspecialista { IdOficio = f.IdOficio, Certificacion = f.Certificaciones }));

                Usuario newUser = await _usuarioService.CreateEspecialist(userToCreate);
                Usuario user = await _usuarioService.GetById(newUser.Id);
                if (user == null) return NotFound();
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(user);
                return Created("Created", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }
        /// <summary>
        /// Cambiar de tipo a un Usuario Ciente a Especialista
        /// </summary>
        /// <param name="userRegisterRequest"></param>
        /// <returns></returns>
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
                Usuario user = await _usuarioService.GetById(newUser.Id);
                if (user == null) return NotFound();
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(user);
                return Created("Created", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }
        /// <summary>
        /// Editar Espacialista
        /// </summary>
        /// <param name="userUpdateRequest"></param>
        /// <returns></returns>
        [HttpPut("Especialista")]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(EspecialistResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<EspecialistResourceResponse>> UpdateEspecialista([FromBody] EspecialistUpdateRequest userUpdateRequest)
        {
            try
            {
                var validator = new EspecialistaUpdateRequestValidator();
                var validatorResult = await validator.ValidateAsync(userUpdateRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                //Mapper
                var userToUpdate = _mapper.Map<EspecialistUpdateRequest, Usuario>(userUpdateRequest);
                userUpdateRequest.Oficios.ForEach(f => userToUpdate.Especialista.OficioEspecialista.Add(new OficioEspecialista { IdOficio = f.IdOficio, Certificacion = f.Certificaciones, IdEspecialista = userToUpdate.Id }));

                Usuario newUser = await _usuarioService.UpdateEspecialist(userToUpdate);
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(newUser);
                return Created("Updated", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }


        /// <summary>
        /// Activar y Desactivar usuarios
        /// </summary>
        /// <param name="id">ID de Usuario</param>
        /// <param name="activacion">False: Desactivar, True: Activar</param>
        /// <returns></returns>
        [HttpPut("{id}/Activacion/{activacion}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(EspecialistResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<bool>> Activacion([FromRoute] int id, [FromRoute] bool activacion)
        {
            try
            {
                if (id == null)
                    return BadRequest("ID de Usuario no puede estar vacio");
                bool activacionResult = await _usuarioService.UserActivation(id, activacion);
                if (activacionResult)
                {
                    return Ok("Updated");
                }
                else
                {
                    return NotFound();
                }

            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }

    }
}
