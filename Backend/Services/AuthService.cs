using Api.Utilities;
using Core;
using Core.Models;
using Core.Repositories;
using Core.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Services
{
    public class AuthService : IAuthService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IConfiguration _configuration;
        public AuthService(IUnitOfWork unitOfWork, IConfiguration cofiguration)
        {
            _unitOfWork = unitOfWork;
            _configuration = cofiguration;
        }
        public async Task<string> Auth(string correo, string contrasenia)
        {
            var valido = false;
            contrasenia = Encrypt.GetSHA256(contrasenia);
            var usuario = await _unitOfWork.UsuarioRepository.GetUsuarioLoginAsync(correo, contrasenia);
            if (usuario == null) return null;

             var token = GetToken(usuario.Id, usuario.Rol, usuario.Correo);
            if (token != null)
            {
                valido = true;
            }
            var response = JsonConvert.SerializeObject(new { Valido = valido, Titulo = "Login", Token = token, idUser = usuario.Id, Rol = usuario.Rol });
            return response;
        }

        private string GetToken(int id, string rol, string correo)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes("27340c5a942aa436845ca719894f0c2d57a5a87b01f55f7327123e2899c76ece");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(
                    new Claim[]
                    {
                        new Claim(ClaimTypes.NameIdentifier, id.ToString()),
                        new Claim(ClaimTypes.Role, rol),
                    }
                    ),
                Expires = DateTime.UtcNow.AddDays(60),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
