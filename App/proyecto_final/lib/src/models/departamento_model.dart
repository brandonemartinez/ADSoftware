import 'package:home_life/src/models/ciudad_model.dart';

class DepartamentoModel {
  DepartamentoModel({
    // this.id,
    this.nombre,
    this.ciudades,
  });

  // final int? id;
  final String? nombre;
  final List<CiudadModel>? ciudades;

  factory DepartamentoModel.fromJson(Map<String, dynamic> parsedJson) {
    return DepartamentoModel(
      nombre: parsedJson['departamento'] as String,
      ciudades: CiudadModel.fromList(
        parsedJson['ciudades'],
      ),
    );
  }
}
