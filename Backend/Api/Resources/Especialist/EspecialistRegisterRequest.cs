﻿using Dtos.Dto;
using Dtos.Dto.Especialista;

namespace Api.Resources.Especialist
{
    public class EspecialistRegisterRequest
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string NombreUsuario { get; set; }
        public string Contrasenia { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Genero { get; set; }
        public int IdDepartamento { get; set; }
        public string? RazonSocial { get; set; }
        public string Rut { get; set; }
        public string NombreFantasia { get; set; }
        public string RangoDia { get; set; }
        public int HoraDesde { get; set; }
        public int HoraHasta { get; set; }
        public string DepartamentoDisponible { get; set; }
        public string Presentacion { get; set; }
        public int idPaquete { get; set; }
        public List<OficioDetalleDto> Oficios { get; set; }

    }
}
