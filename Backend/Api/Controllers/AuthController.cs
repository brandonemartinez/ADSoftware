using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        //private readonly IAuthService _authService;

        //public AuthController(IAuthService authService)
        //{
        //    _authService = authService;
        //}
        ///// <summary>
        ///// Login
        ///// </summary>
        ///// <returns></returns>
        //[HttpGet]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //public async Task<ActionResult<bool>> Login(LoginData loginData)
        //{
        //    var departamentoCollection = await _authService.Login(loginData);
        //    if (departamentoCollection == null) return NotFound($"No se encontro ningun departamento");
        //    var especialistaResourcesListResponse = _mapper.Map<IEnumerable<Departamento>, IEnumerable<DepartmentResourceListResponse>>(departamentoCollection);
        //    return Ok(especialistaResourcesListResponse);
        //}
    }
}
