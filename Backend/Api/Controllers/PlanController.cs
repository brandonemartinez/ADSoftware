using Api.Resources.Cita;
using Api.Resources.Plan;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto.Plan;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class PlanController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IPlanService _planService;
        public PlanController(IMapper mapper, IPlanService planService)
        {
            _mapper = mapper;
            _planService = planService;
        }

        /// <summary>
        /// Agregar plan
        /// </summary>
        /// <param name="citaResourceCreateRequest"></param>
        /// <returns></returns>
        [HttpPost]
        //[Authorize(Roles = "Administrador")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> Post([FromBody] PlanResourceCreateRequest citaResourceCreateRequest)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            Paquete plan = _mapper.Map<PlanResourceCreateRequest, Paquete>(citaResourceCreateRequest);

            bool newPlan = await _planService.Create(plan);

            return Created(nameof(_planService.Create), new { Result = $"Se agrego el plan {plan.Nombre} exitosamente." });
        }

        /// <summary>
        /// Obtener todos los planes
        /// </summary>
        /// <param name="citaResourceCreateRequest"></param>
        /// <returns></returns>
        [HttpGet]
        //[Authorize(Roles = "Administrador")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> Get()
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            IEnumerable<Paquete> paquetes = await _planService.GetAll();
            IEnumerable<PlanListResourceResponse> planes = _mapper.Map<IEnumerable<Paquete>, IEnumerable<PlanListResourceResponse>>(paquetes);
            return Created(nameof(_planService.GetAll), new { Result = planes });
        }


        [HttpGet("{idPlan}")]
        //[Authorize(Roles = "Administrador")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<PlanDto>> GetById([FromRoute] int idPlan)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();

            Paquete paquete = await _planService.GetById(idPlan);
            if(paquete == null)
            {
                return NotFound($"No exite ningun plan con la id: {idPlan}");
            }

            PlanDto plan = _mapper.Map<Paquete, PlanDto>(paquete);
            return Created(nameof(_planService.GetById), new { Result = plan });
        }

    }
}
