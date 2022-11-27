class ClienteModel {
  ClienteModel({
    this.nombre,
    this.apellido,
    this.nombreUsuario,
    this.contrasenia,
    this.correo,
    this.telefono,
    this.direccion,
    this.fechaNacimiento,
    this.genero,
    this.idDepartamento,
  });

  String? nombre;
  String? apellido;
  String? nombreUsuario;
  String? contrasenia;
  String? correo;
  String? telefono;
  String? direccion;
  DateTime? fechaNacimiento;
  String? genero;
  int? idDepartamento;

  factory ClienteModel.fromJson(Map<String, dynamic> parsedJson) {
    return ClienteModel(
      nombre: parsedJson['nombre'],
      apellido: parsedJson['apellido'],
      nombreUsuario: parsedJson['nombreUsuario'],
      contrasenia: parsedJson['contrasenia'],
      correo: parsedJson['correo'],
      telefono: parsedJson['telefono'],
      direccion: parsedJson['direccion'],
      fechaNacimiento: parsedJson['fechaNacimiento'] as DateTime,
      genero: parsedJson['genero'],
      idDepartamento: parsedJson['idDepartamento'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nombre": nombre,
      "apellido": apellido,
      "nombreUsuario": nombreUsuario,
      "contrasenia": contrasenia,
      "correo": correo,
      "telefono": telefono,
      "direccion": direccion,
      "fechaNacimiento": fechaNacimiento?.toIso8601String(),
      "genero": genero,
      "idDepartamento": idDepartamento,
    };
  }
}
