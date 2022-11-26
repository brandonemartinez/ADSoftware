using Api.Resources;
using Api.Resources.Auth;
using Core.Services;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Linq.Dynamic.Core.Tokenizer;
using System.Text.Json.Serialization;

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
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(RespuestaLogin))]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        public async Task<ActionResult<RespuestaLogin>> Login([FromBody]LoginData loginData)
        {
            var token = await _authService.Auth(loginData.Correo, loginData.Contraseña);
            if (token == null) return NotFound($"Credenciales invalidas.");
            RespuestaLogin respuesta = JsonConvert.DeserializeObject<RespuestaLogin>(token);
            return Ok(respuesta);
        }
    }
}
