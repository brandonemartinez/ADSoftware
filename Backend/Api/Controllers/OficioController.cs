using Api.Resources.Department;
using AutoMapper;
using Core.Models;
using Core.Services;
using Dtos.Dto;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
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
        /// Obtener todos los oficios
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IEnumerable<OficioDetalleDto>>> GetAll()
        {
            IEnumerable<Oficio> oficioDtoCollection = await _oficioService.GetAll();
            if (oficioDtoCollection == null) return NotFound($"No se encontro ningun oficio");
            var response = _mapper.Map<IEnumerable<Oficio>, IEnumerable<OficioDetalleDto>>(oficioDtoCollection);
            return Ok(response);
        }
    }
}
