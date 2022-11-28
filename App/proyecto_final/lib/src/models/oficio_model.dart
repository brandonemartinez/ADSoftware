import 'package:home_life/src/util/jsonable.dart';

class OficioModel extends Jsonable {
  OficioModel({
    this.id,
    this.nombre,
  });

  final int? id;
  final String? nombre;

  factory OficioModel.fromJson(Map<String, dynamic> parsedJson) {
    return OficioModel(
      id: parsedJson['id'],
      nombre: parsedJson['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
