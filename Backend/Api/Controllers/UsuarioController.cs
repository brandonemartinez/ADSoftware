using Api.Resources.Client;
using Api.Resources.Especialist;
using Api.Resources.Usuario;
using Api.Validators;
using AutoMapper;
using Core.Models;
using Core.Services;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using Services.Utilities;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService _usuarioService;
        private readonly IEspecialistaService _especialistaService;
        private readonly IArchivoService _archivoService;
        private readonly IMapper _mapper;

        public UsuarioController(IUsuarioService userservice,
                                 IEspecialistaService especialistaService,
                                 IArchivoService archivoService,
                                 IMapper mapper)
        {
            _especialistaService = especialistaService;
            _usuarioService = userservice;
            _archivoService = archivoService;
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
                if (userRegisterRequest == null)
                    return BadRequest("El usuario para registrar esta vacio.");

                var validator = new EspecialistRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                //Mapper
                var userToCreate = _mapper.Map<EspecialistRegisterRequest, Usuario>(userRegisterRequest);
                //TODO Validate
                //userRegisterRequest.Oficios.ForEach(f => userToCreate.Especialista.IdOficios.Add(new Oficio { Id = f.IdOficio }));
                //if (userRegisterRequest.FotoPerfil != null)
                //{
                //    //userToCreate.Especialista.FotoPerfil = await FileHelper.MapFileToAdd(userRegisterRequest.FotoPerfil);
                //}


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
        public async Task<ActionResult<EspecialistResourceResponse>> CreatedUsuarioEspecialista([FromBody] CreatedEspecialistRegisterRequest userRegisterRequest)
        {
            try
            {
                var validator = new CreatedEspecialistRegisterRequestValidator();
                var validatorResult = await validator.ValidateAsync(userRegisterRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                var userToCreate = _mapper.Map<CreatedEspecialistRegisterRequest, Usuario>(userRegisterRequest);
                Usuario newUser = await _usuarioService.CreateAlreadyEspecialist(userToCreate);
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
                //TODO Validate
                //userUpdateRequest.Oficios.ForEach(f => userToUpdate.Especialista.OficioEspecialista.Add(new OficioEspecialista { IdOficio = f.IdOficio, IdEspecialista = userToUpdate.Id }));

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
        /// Editar Cliente
        /// </summary>
        /// <param name="userUpdateRequest"></param>
        /// <returns></returns>
        [HttpPut("Cliente")]
        [ProducesResponseType(StatusCodes.Status201Created, Type = typeof(ClientResourceResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ClientResourceResponse>> UpdateCliente([FromBody] ClientUpdateRequest userUpdateRequest)
        {
            try
            {
                var validator = new ClientUpdateRequestValidator();
                var validatorResult = await validator.ValidateAsync(userUpdateRequest);
                if (!validatorResult.IsValid)
                    return BadRequest(validatorResult.Errors);

                //Mapper
                var userToUpdate = _mapper.Map<ClientUpdateRequest, Usuario>(userUpdateRequest);

                Usuario newUser = await _usuarioService.UpdateClient(userToUpdate);
                ClientResourceResponse response = _mapper.Map<Usuario, ClientResourceResponse>(newUser);
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
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<bool>> Activacion([FromRoute] int id, [FromRoute] bool activacion)
        {
            try
            {
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

        /// <summary>
        /// Agregar foto de perfil
        /// </summary>
        /// <param name="file"></param>
        /// <param name="idEspecialista"></param>
        /// <returns></returns>
        [HttpPost("AgregarFotoPerfil/{idEspecialista}")]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<string>> GuardarFotoPerfil([FromForm] IFormFile file, int idEspecialista)
        {

            try
            {
                byte[] fileBytes;
                using (var memoryStream = new MemoryStream())
                {
                    await file.CopyToAsync(memoryStream);
                    fileBytes = memoryStream.ToArray();
                }
                await _archivoService.Create(fileBytes, idEspecialista, true);
                return Ok("Archivo guardado");
            }
            catch (Exception exe)
            {
                throw exe;
            }
        }

        /// <summary>
        /// Agregar Certificaciones
        /// </summary>
        /// <param name="files"></param>
        /// <param name="idEspecialista"></param>
        /// <returns></returns>
        [HttpPost("AgregarCertificaciones/{idEspecialista}")]
        [Consumes("multipart/form-data")]
        public async Task<ActionResult<string>> GardarCertificaciones([FromForm] List<IFormFile> files, int idEspecialista)
        {
            try
            {
                foreach (var file in files)
                {
                    byte[] fileBytes;
                    using (var memoryStream = new MemoryStream())
                    {
                        await file.CopyToAsync(memoryStream);
                        fileBytes = memoryStream.ToArray();
                    }
                    await _archivoService.Create(fileBytes, idEspecialista, false);
                }   
                return Ok("Archivos guardados");
            }
            catch (Exception exe)
            {
                throw exe;
            }
        }
    }
}
