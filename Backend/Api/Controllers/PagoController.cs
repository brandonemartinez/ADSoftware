using Api.Resources.Pago;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto;
using Microsoft.AspNetCore.Mvc;
using Services;
using System.Security.Claims;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class PagoController : Controller
    {
        private readonly IPagoService _pagoService;
        private readonly IMapper _mapper;
        public PagoController(IPagoService pagoService, IMapper mapper)
        {
            _pagoService = pagoService;
            _mapper = mapper;
        }

        /// <summary>
        /// Realizar Pago Cita
        /// </summary>
        /// <returns></returns>
        [HttpPost("Cita")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult> PagoCita([FromBody] RegistrarPagoCita registrarPagoCita)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            string response = await _pagoService.RegistrarPagoCita(registrarPagoCita.idCita, registrarPagoCita.pago, int.Parse(userData[0].Value));
            if (String.IsNullOrWhiteSpace(response))
                return BadRequest("Pago rechazado");
            
            return Ok(response);
        }

        /// <summary>
        /// Realizar Pago Plan
        /// </summary>
        /// <param name="registrarPagoPlan">pago: Aceptado/Rechazado, anual: false=menusal/true=anual</param>
        /// <returns></returns>
        [HttpPost("Plan")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult> PagoPlan([FromBody] RegistrarPagoPlan registrarPagoPlan)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            string response = await _pagoService.RegistrarPagoPlan(registrarPagoPlan.idPlan, registrarPagoPlan.pago, int.Parse(userData[0].Value), registrarPagoPlan.anual);

            if (String.IsNullOrWhiteSpace(response))
                return BadRequest("Pago rechazado");

            return Ok(response);
        }
    }
}
