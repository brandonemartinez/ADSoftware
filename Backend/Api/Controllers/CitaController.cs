using Api.Resources.Cita;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto.Cita;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]

    public class CitaController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly ICitaService _citaService;
        public CitaController(IMapper mapper, ICitaService citaService)
        {
            _mapper = mapper;
            _citaService = citaService;
        }

        /// <summary>
        /// Crear cita
        /// </summary>
        /// <param name="citaResourceCreateRequest"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize(Roles = "Cliente")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> Post([FromBody] CitaResourceCreateRequest citaResourceCreateRequest)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            Cita cita = _mapper.Map<CitaResourceCreateRequest, Cita>(citaResourceCreateRequest);
            string newCita = await _citaService.CreateCita(cita, citaResourceCreateRequest.IdEspecialista, int.Parse(userData[0].Value));

            return Created(nameof(_citaService.CreateCita), new { Result = newCita });
        }

        /// <summary>
        /// Obtener citas
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize(Roles = "Cliente, Especialista")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> GetCitaCliente()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            IEnumerable<Cita> citas = await _citaService.GetById(int.Parse(userData[0].Value));
            IEnumerable<CitaDto> citasDtoCollection = _mapper.Map<IEnumerable<Cita>, IEnumerable<CitaDto>>(citas);

            return Ok(citasDtoCollection);
        }

        /// <summary>
        /// Obtener citas
        /// </summary>
        /// <returns></returns>
        [HttpPut("{idCita}/{status}")]
        [Authorize(Roles = "Cliente, Especialista")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> CambiarEstadoCita([FromRoute] int idCita, [FromRoute] string status)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            string result = await _citaService.UpdateStatus(idCita, int.Parse(userData[0].Value), status);
            
            return Ok(result);
        }
    }
}
