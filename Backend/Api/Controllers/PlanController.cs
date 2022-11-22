using Api.Resources.Cita;
using Api.Resources.Plan;
using AutoMapper;
using Core.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Constants;
using System.Security.Claims;

namespace Api.Controllers
{
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
        [Authorize(Roles = "Administrador")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<CitaResourceResponse>> Post([FromBody] PlanResourceCreateRequest citaResourceCreateRequest)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;
            var userData = identity.Claims.ToList();
            if (userData == null)
                return Unauthorized();
            
            Plan plan = _mapper.Map<PlanResourceCreateRequest, Plan>(citaResourceCreateRequest);
            string newPlan = await _planService.Create(plan);

            return Created(nameof(_planService.CreateCita), new { Result = newPlan });
        }
    }
}
