using Api.Utilities;
using Core;
using Core.Models;
using Core.Repositories;
using Core.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
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
            contrasenia = Encrypt.GetSHA256(contrasenia);

            var usuario = await _unitOfWork.UsuarioRepository.GetUsuarioLoginAsync(correo, contrasenia);
            if (usuario == null) return null;

            return GetToken(correo, contrasenia);
        }

        private string GetToken(string correo, string contrasenia)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes(_configuration.GetSection("Auth:Token").Value);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(
                    new Claim[]
                    {
                        new Claim(ClaimTypes.NameIdentifier, correo),
                        new Claim(ClaimTypes.Role, "Administrador")
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
