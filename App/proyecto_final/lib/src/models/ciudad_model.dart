class CiudadModel {
  CiudadModel({
    this.id,
    this.nombre,
  });

  final int? id;
  final String? nombre;

  factory CiudadModel.fromJson(Map<String, dynamic> parsedJson) {
    return CiudadModel(
      id: parsedJson['id'],
      nombre: parsedJson['nombre'],
    );
  }

  static List<CiudadModel>? fromList(List<dynamic>? list) {
    var result = <CiudadModel>[];
    list?.forEach(
      (item) {
        var ciudad = CiudadModel.fromJson(item);
        if (ciudad != null) {
          result.add(ciudad);
        }
      },
    );

    return result;
  }
}
