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
            return $"<table style=\"height: 224px; width: 50.9924%; border-collapse: collapse; border-style: hidden; margin-left: auto; margin-right: auto;\" border=\"1\"><caption>&nbsp;</caption>\r\n<tbody>\r\n<tr style=\"height: 54px;\">\r\n<td style=\"width: 100%; height: 54px;\">\r\n<h3 style=\"text-align: center;\">Hola Brandon!&nbsp;</h3>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 258px;\">\r\n<td style=\"width: 100%; height: 196px;\">\r\n<p style=\"text-align: center;\">Te infomamos que el usuario CLIENTE ha cambiado el estado el estado de tu solicitud del DIA a las HORA a ESTADO.</p>\r\n<p style=\"text-align: center;\"><br />Atentamente,<br /><em>Equipo ADSoftware</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>";
        }
        private string BodyTemplateCambioEstadoAEspecialista(Usuario usuario, Especialista especialista, Cita cita)
        {
            return $"<table style=\"height: 224px; width: 50.9924%; border-collapse: collapse; border-style: hidden; margin-left: auto; margin-right: auto;\" border=\"1\"><caption>&nbsp;</caption>\r\n<tbody>\r\n<tr style=\"height: 54px;\">\r\n<td style=\"width: 100%; height: 54px;\">\r\n<h3 style=\"text-align: center;\">Hola Brandon!&nbsp;</h3>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 258px;\">\r\n<td style=\"width: 100%; height: 196px;\">\r\n<p style=\"text-align: center;\">Te infomamos que el usuario CLIENTE ha cambiado el estado de la cita con FECHA para las HORAS a ESTADO.</p>\r\n<p style=\"text-align: center;\"><br />Atentamente,<br /><em>Equipo ADSoftware</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>";
        }
        private string BodyTemplateCuentaCreada(string nombre)
        {
            return $"<table style=\"height: 250px; width: 52.2708%; border-collapse: collapse; border-style: hidden; margin-left: auto; margin-right: auto;\" border=\"1\"><caption>&nbsp;</caption>\r\n<tbody>\r\n<tr style=\"height: 54px;\">\r\n<td style=\"width: 100%; height: 54px;\">\r\n<h3 style=\"text-align: center;\">Bienvenido Brandon!&nbsp;</h3>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 258px;\">\r\n<td style=\"width: 100%; height: 196px;\">\r\n<p style=\"text-align: center;\">Te infomamos que tu cuenta ha sido creada.</p>\r\n<p style=\"text-align: center;\">Con mucho gusto queremos darte las gracias por confiar en nosotros para facilitar la manera en la buscas y encuentras servicios.<br /><br />Atentamente,<br /><em>Equipo ADSoftware</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>";
        }
    }
}
