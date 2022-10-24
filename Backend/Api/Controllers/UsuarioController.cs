﻿using Api.Resources.Client;
using Api.Resources.Especialist;
using Api.Validators;
using AutoMapper;
using Core.Models;
using Core.Services;
using FluentValidation;
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

                //Mapper
                var userToCreate = _mapper.Map<EspecialistRegisterRequest, Usuario>(userRegisterRequest);
                userRegisterRequest.Oficios.ForEach(f => userToCreate.Especialista.OficioEspecialista.Add(new OficioEspecialista { IdOficio = f.IdOficio, Certificaciones = f.Certificaciones, Documento = userRegisterRequest.Documento }));

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
                userUpdateRequest.Oficios.ForEach(f => userToUpdate.Especialista.OficioEspecialista.Add(new OficioEspecialista { IdOficio = f.IdOficio, Certificaciones = f.Certificaciones, Documento = userToUpdate.Documento}));

                Usuario newUser = await _usuarioService.UpdateEspecialist(userToUpdate);
                EspecialistResourceResponse response = _mapper.Map<Usuario, EspecialistResourceResponse>(newUser);
                return Created("Updated", response);
            }
            catch (ArgumentException exception)
            {
                throw exception;
            }
        }

    }
}
