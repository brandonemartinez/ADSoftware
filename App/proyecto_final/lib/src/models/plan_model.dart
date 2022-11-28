class PlanModel {
  PlanModel({
    this.id,
    this.precioMensual,
    this.precioAnual,
    this.cantidadCiudades,
    this.nombre,
    this.descripcion,
    this.cantidadProfesiones,
  });

  final int? id;
  final int? precioMensual;
  final int? precioAnual;
  final int? cantidadCiudades;
  final String? nombre;
  final String? descripcion;
  final int? cantidadProfesiones;

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'],
      precioMensual: json['precioMensual'],
      precioAnual: json['precioAnual'],
      cantidadCiudades: json['cantidadCiudades'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      cantidadProfesiones: json['cantidadProfesiones'],
    );
  }

  static List<PlanModel>? fromList(List<dynamic>? list) {
    var result = <PlanModel>[];
    list?.forEach(
          (item) {
        var plan = PlanModel.fromJson(item);
        if (plan != null) {
          result.add(plan);
        }
      },
    );

    return result;
  }
}
