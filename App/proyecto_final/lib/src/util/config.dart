import 'package:home_life/src/util/constants.dart';

import '../models/oficio_model.dart';

List<String>? ciudadesSeleccionadas = [];
List<String>? oficiosSeleccionados = [];

String armarString() {
  String ciudadesFinales = '';
  ciudadesSeleccionadas?.forEach(
    (ciudad) {
      ciudadesFinales += '${ciudad}, ';
    },
  );

  return ciudadesFinales;
}

List<OficioModel> armarOficios() {
  List<OficioModel> oficiosFinales = [];
  oficiosSeleccionados?.forEach(
    (string) {
      oficios?.forEach(
        (element) {
          if (element.nombre == string) {
            oficiosFinales.add(element);
          }
        },
      );
    },
  );

  return oficiosFinales;
}
