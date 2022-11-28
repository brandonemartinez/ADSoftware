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

  static List<OficioModel>? fromList(List<dynamic>? list) {
    var result = <OficioModel>[];
    list?.forEach(
          (item) {
        var oficio = OficioModel.fromJson(item);
        if (oficio != null) {
          result.add(oficio);
        }
      },
    );

    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
