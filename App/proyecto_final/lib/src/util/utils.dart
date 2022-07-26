import 'package:flutter/material.dart';

import '../models/oficio_model.dart';
import 'constants.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
var primaryColor = Color(0xff243a69);
MaterialColor primaryMaterialColor = MaterialColor(0xff243a69, color);
var secondaryColor = Color(0xffff9800);
var backgroundColor = Color(0xffe9f2f9);
var userName = 'Pablo Martinez';
final border = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
    width: 2.0,
  ),
  borderRadius: borderRadius,
);
var borderRadius = BorderRadius.circular(25.0);

int getIdDepartamentoByName(String departamento) {
  switch (departamento) {
    case 'Montevideo':
      return 1;
    case 'Maldonado':
      return 2;
    case 'Salto':
      return 3;
    case 'Canelones':
      return 4;
    case 'Lavalleja':
      return 5;
    default:
      return 2;
  }
}

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
