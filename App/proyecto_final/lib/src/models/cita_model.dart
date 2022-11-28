class CitaModel {
  CitaModel({
    this.fecha,
    this.horaDesde,
    this.horaHasta,
    this.idEspecialista,
    this.idCliente,
    this.ciudad,
    this.descripcion,
  });

  DateTime? fecha;
  int? horaDesde;
  int? horaHasta;
  int? idEspecialista;
  int? idCliente;
  String? ciudad;
  String? descripcion;

  factory CitaModel.fromJson(Map<String, dynamic> parsedJson) {
    return CitaModel(
      fecha: parsedJson['fecha'] as DateTime,
      horaDesde: parsedJson['horaDesde'] as int,
      horaHasta: parsedJson['horaHasta'] as int,
      idEspecialista: parsedJson['idEspecialista'] as int,
      idCliente: parsedJson['idCliente'] as int,
      ciudad: parsedJson['localidad'],
      descripcion: parsedJson['descripcion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fecha': fecha?.toIso8601String(),
      'horaDesde': horaDesde,
      'horaHasta': horaHasta,
      'idEspecialista': idEspecialista,
      'idCliente': idEspecialista,
      'localidad': ciudad,
      'descripcion': descripcion,
    };
  }

  static List<CitaModel>? fromList(List<dynamic>? list) {
    var result = <CitaModel>[];
    list?.forEach(
      (item) {
        var cita = CitaModel.fromJson(item);
        if (cita != null) {
          result.add(cita);
        }
      },
    );

    return result;
  }
}
