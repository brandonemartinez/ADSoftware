using Core.Services;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;
        private string _emailFrom;
        private string _emailPass;
        private readonly string _asunto = "Bienvenido a ADSoftware!";

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
            _emailFrom = _configuration.GetSection("Email:EmailDesde").Value;
            _emailPass = _configuration.GetSection("Email:EmailDesdePass").Value;
        }

        public void EnviarEmailCuentaCreada(string emailTo, string nombre)
        {
            try
            {
                MailMessage MailMessage = new MailMessage(_emailFrom, emailTo, _asunto, BodyTemplate(nombre));
                MailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Port = 587;
                smtpClient.Credentials = new System.Net.NetworkCredential(_emailFrom, _emailPass);
                smtpClient.Send(MailMessage);
                smtpClient.Dispose();
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }

        private string BodyTemplate(string nombre)
        {
            return $"<h3>{nombre},</h3><br><p> Te damos la bienvenida a nuestra aplicacion</p><br><p> Con mucho gusto queremos darte las gracias por confiar en nosotros para facilitar la manera en la buscas y encuentras servicios.</p><br><p>Atentamente,<br>equipo ADSoftware</p> ";
        }
    }
}
