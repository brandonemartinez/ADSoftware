using Api.Resources.Auth;
using Core.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Consumes("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }
        /// <summary>
        /// Login de Usuario
        /// </summary>
        /// <returns></returns>
        [HttpPost("Login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult> Login([FromBody]LoginData loginData)
        {
            var userResponse = await _authService.Auth(loginData.Correo, loginData.Contraseña);

            if (userResponse == null)
                return BadRequest();

            return Ok(userResponse);
        }
    }
}
