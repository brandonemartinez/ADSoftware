using Api.Resources.Especialist;
using AutoMapper;
using Core.Models;
using Core.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.Admin
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class ReporteController : ControllerBase
    {
        private readonly IReporteService _reporteService;
        private readonly IMapper _mapper;
        public ReporteController(IReporteService reporteService, IMapper mapper)
        {
            _reporteService = reporteService;
            _mapper = mapper;
        }

        ///// <summary>
        ///// Obtener a todos los Especialistas sin ningun filtro
        ///// </summary>
        ///// <returns></returns>
        //[HttpGet]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //public async Task<ActionResult<IEnumerable<EspecialistaResourceListResponse>>> GetAll()
        //{
        //    var especialsitaCollection = await _especialistaService.GetAll();
        //    if (especialsitaCollection == null) return NotFound($"No se encontro ningun especialista");
        //    var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Especialista>, IEnumerable<EspecialistaResourceListResponse>>(especialsitaCollection);
        //    return Ok(especialistaResourcesListResponse);
        //}  
    }
}
