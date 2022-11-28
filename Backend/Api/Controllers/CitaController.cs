using Api.Resources;
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
    //[Authorize(Roles = "Cliente, Especialsita")]
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
        /// Crear una cita
        /// </summary>
        /// <param name="citaResourceCreateRequest">Informacion de cita</param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> Post([FromBody] CitaResourceCreateRequest citaResourceCreateRequest)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            if ((citaResourceCreateRequest.HoraDesde > citaResourceCreateRequest.HoraHasta) || citaResourceCreateRequest.HoraDesde == 0
                || citaResourceCreateRequest.HoraHasta == 0)
            {
                return BadRequest("Se encontro un error en el horario.");
            }
            if(citaResourceCreateRequest.Fecha < DateTime.Now)
            {
                return BadRequest("Dia no puede ser menor a la fecha actual");
            }

            Cita cita = _mapper.Map<CitaResourceCreateRequest, Cita>(citaResourceCreateRequest);
            string newCita = await _citaService.CreateCita(cita, citaResourceCreateRequest.IdEspecialista, citaResourceCreateRequest.IdCliente);

            return Created(nameof(_citaService.CreateCita), new { Result = newCita });
        }

        /// <summary>
        /// Obtener citas que se solicitaron al usuario
        /// </summary>
        /// <returns></returns>
        [HttpGet("Agenda/{idEspecialista}")]
        //[Authorize(Roles = "Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(IEnumerable<CitaDto>))]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> GetAgenda([FromRoute] int idEspecialsita)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            IEnumerable<Cita> citas = await _citaService.GetCitasAgenda(idEspecialsita);
            IEnumerable<CitaDto> citasDtoCollection = _mapper.Map<IEnumerable<Cita>, IEnumerable<CitaDto>>(citas);

            return Ok(citasDtoCollection);
        }

        /// <summary>
        /// Obtiene solicitudes realizadas por el usuario
        /// </summary>
        /// <returns></returns>
        [HttpGet("Solicitudes/{idUsuario}")]
        //[Authorize(Roles = "Cliente, Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(IEnumerable<CitaDto>))]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<IEnumerable<CitaDto>>> GetSolicitudes([FromRoute] int idUsuario)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            IEnumerable<Cita> citas = await _citaService.GetSolicitudes(idUsuario);
            IEnumerable<CitaDto> citasDtoCollection = _mapper.Map<IEnumerable<Cita>, IEnumerable<CitaDto>>(citas);

            return Ok(citasDtoCollection);
        }

        /// <summary>
        /// Cambiar estado cita
        /// </summary>
        /// <returns></returns>
        [HttpPut("{idCita}/{status}/{idUsuario}")]
        //[Authorize(Roles = "Cliente, Especialista")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> CambiarEstadoCita([FromRoute] int idCita, [FromRoute] string status, [FromRoute] int idUsuario)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            string result = await _citaService.UpdateStatus(idCita, idUsuario, status);
            
            return Ok(result);
        }
    }
}
