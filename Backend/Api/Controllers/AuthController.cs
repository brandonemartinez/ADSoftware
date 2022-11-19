using Api.Resources;
using Api.Resources.Auth;
using Core.Services;
using Microsoft.AspNetCore.Mvc;
using System.Linq.Dynamic.Core.Tokenizer;

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
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult> Login([FromBody]LoginData loginData)
        {
            var token = await _authService.Auth(loginData.Correo, loginData.Contraseña);

            if (token == null)
                return NotFound(new RespuestaLogin
                {
                    Titulo = "Login",
                    Valido = false,
                    Token = token
                });

            return Ok(new RespuestaLogin
            {
                Titulo = "Login",
                Valido = true,
                Token = token
            });
        }
    }
}
