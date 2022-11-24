using Api.Resources.Department;
using Api.Resources.Oficio;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers.Admin
{
    [Consumes("application/json")]
    [Route("api/admin/[controller]")]
    [ApiController]
    public class OficioController : Controller
    {
        private readonly IOficioService _oficioService;
        private readonly IMapper _mapper;
        public OficioController(IOficioService oficioService, IMapper mapper)
        {
            _oficioService = oficioService;
            _mapper = mapper;
        }

        /// <summary>
        /// Crear Oficio
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<OficioDetalleDto>>> CreateOficio([FromBody] OficioResourceCreateRequest oficioResourceCreateRequest)
        {
            var oficio = _mapper.Map<OficioResourceCreateRequest, Oficio>(oficioResourceCreateRequest);
            bool result = await _oficioService.CreateOficio(oficio);
            if(result)
                return Ok($"El Oficio de {oficioResourceCreateRequest.Nombre} fue creado correctamente");
            else
                return BadRequest("No se pudo crear el oficio");
        }
    }
}
