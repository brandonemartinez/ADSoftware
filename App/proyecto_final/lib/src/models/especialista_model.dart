class EspecialistaModel {
  EspecialistaModel({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.nombreUsuario,
    required this.contrasenia,
    required this.correo,
    required this.telefono,
    required this.direccion,
    required this.fechaDeNacimiento,
    required this.genero,
    required this.idDepartamento,
    required this.razonSocial,
    required this.rut,
    required this.nombreFantasia,
    required this.horaDesde,
    required this.horaHasta,
    required this.departamentoDisponible,
    required this.presentacion,
    required this.idPaquete,
    required this.oficios,
    required this.calificacion,
    required this.rangoDia,
  });

  final int id;
  final String nombre;
  final String apellido;
  final String nombreUsuario;
  final String contrasenia;
  final String correo;
  final String telefono;
  final String direccion;
  final DateTime fechaDeNacimiento;
  final String genero;
  final String idDepartamento;
  final String razonSocial;
  final String rut;
  final String nombreFantasia;
  final int horaDesde;
  final int horaHasta;
  final String departamentoDisponible;
  final String presentacion;
  final String idPaquete;
  final List<String> oficios; //No es string
  final String calificacion;
  final String rangoDia;
}
