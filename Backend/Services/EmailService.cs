using Core.Models;
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
        private readonly string _asuntoBienvenida = "Bienvenido a ADSoftware!";
        private readonly string _asuntoCambioEstado = "Cambio de Estado en Solicitud";

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
                MailMessage MailMessage = new MailMessage(_emailFrom, emailTo, _asuntoBienvenida, BodyTemplateCuentaCreada(nombre));
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


        public void CambioEstadoACliente(Cita cita, string estado)
        {
            Usuario cliente = cita.IdUsuarios.FirstOrDefault(f => f.Id == cita.IdCliente);
            Usuario especialista = cita.IdUsuarios.FirstOrDefault(f => f.Id == cita.IdEspecialista);
            try
            {
                MailMessage MailMessage = new MailMessage(_emailFrom, cliente.Correo, _asuntoCambioEstado, BodyTemplateCambioEstadoACliente(cliente, especialista.Especialista, cita));
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

        public void CambioEstadoAEspecialista(Cita cita, string estado)
        {
            Usuario cliente = cita.IdUsuarios.FirstOrDefault(f => f.Id == cita.IdCliente);
            Usuario especialista = cita.IdUsuarios.FirstOrDefault(f => f.Id == cita.IdEspecialista);
            try
            {
                MailMessage MailMessage = new MailMessage(_emailFrom, cliente.Correo, _asuntoCambioEstado, BodyTemplateCambioEstadoAEspecialista(cliente, especialista.Especialista, cita));
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
        //TODO HACER TEMPLATES
        private string BodyTemplateCambioEstadoACliente(Usuario usuario, Especialista especialista, Cita cita)
        {
            return $"<h3>{usuario.Nombre},</h3><br><p> Te damos la bienvenida a nuestra aplicacion</p><br><p> Con mucho gusto queremos darte las gracias por confiar en nosotros para facilitar la manera en la buscas y encuentras servicios.</p><br><p>Atentamente,<br>equipo ADSoftware</p> ";
        }
        private string BodyTemplateCambioEstadoAEspecialista(Usuario usuario, Especialista especialista, Cita cita)
        {
            return $"<h3>{usuario.Nombre},</h3><br><p> Te damos la bienvenida a nuestra aplicacion</p><br><p> Con mucho gusto queremos darte las gracias por confiar en nosotros para facilitar la manera en la buscas y encuentras servicios.</p><br><p>Atentamente,<br>equipo ADSoftware</p> ";
        }
        private string BodyTemplateCuentaCreada(string nombre)
        {
            return $"<h3>{nombre},</h3><br><p> Te damos la bienvenida a nuestra aplicacion</p><br><p> Con mucho gusto queremos darte las gracias por confiar en nosotros para facilitar la manera en la buscas y encuentras servicios.</p><br><p>Atentamente,<br>equipo ADSoftware</p> ";
        }
    }
}
