using Api.Resources.Especialist;
using Api.Resources.Oficio;
using Api.Resources.Reporte;
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

        /// <summary>
        /// Reporte de servicios contratados
        /// </summary>
        /// <returns></returns>
        [HttpGet("{pagina}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ReporteServiciosContratadosResponse))]
        public async Task<ActionResult<ReporteServiciosContratadosResponse>> GetAll([FromRoute]int pagina)
        {
            Tuple<int, IEnumerable<Cita>> especialsitaCollection = await _reporteService.GetServiciosContratados(pagina);
            var elementos = _mapper.Map<IEnumerable<Cita>, List<ServiciosContratadosResponse>> (especialsitaCollection.Item2);
            var response = new ReporteServiciosContratadosResponse
            {
                Pagina = pagina,
                Elementos = elementos,
                TotalElementos = especialsitaCollection.Item1
            };
            return Ok(response);
        }
    }
}
