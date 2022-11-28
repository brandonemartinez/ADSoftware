import 'package:home_life/src/models/oficio_model.dart';

import '../models/departamento_model.dart';

const String kBaseUrl = 'http://192.168.1.2:7120/api/';

List<DepartamentoModel>? departamentos;

List<OficioModel>? oficios;

List<String> getCiudades(String departamento) {
  List<String> ciudades = [];
  departamentos?.forEach(
    (element) {
      if (element.nombre == departamento) {
        if (element.ciudades?.isNotEmpty == true) {
          element.ciudades?.forEach(
            (element) {
              ciudades.add(element.nombre!);
            },
          );
        } else {
          ciudades.add('No hay ciudades disponibles.');
        }
      }
    },
  );
  return ciudades;
}

List<String> horas = [
  '00',
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23'
];