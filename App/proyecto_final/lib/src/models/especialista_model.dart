import 'package:home_life/src/models/oficio_model.dart';
import 'package:home_life/src/util/jsonable.dart';

class EspecialistaModel {
  EspecialistaModel({
    this.id,
    this.nombre,
    this.apellido,
    this.nombreUsuario,
    this.contrasenia,
    this.correo,
    this.telefono,
    this.direccion,
    this.fechaDeNacimiento,
    this.genero,
    this.idDepartamento,
    this.razonSocial,
    this.rut,
    this.nombreFantasia,
    this.horaDesde,
    this.horaHasta,
    this.departamentoDisponible,
    this.presentacion,
    this.idPaquete,
    this.oficios,
    this.rangoDia,
    this.calificacion,
    this.cantidadOficios,
    this.cantidadCiudades,
  });

  int? id;
  String? nombre;
  String? apellido;
  String? nombreUsuario;
  String? contrasenia;
  String? correo;
  String? telefono;
  String? direccion;
  DateTime? fechaDeNacimiento;
  String? genero;
  int? idDepartamento;
  String? razonSocial;
  String? rut;
  String? nombreFantasia;
  String? rangoDia;
  int? horaDesde;
  int? horaHasta;
  String? departamentoDisponible;
  String? presentacion;
  int? idPaquete;
  List<OficioModel>? oficios;
  int? calificacion;
  int? cantidadOficios;
  int? cantidadCiudades;

  factory EspecialistaModel.fromJson(Map<String, dynamic> parsedJson) {
    return EspecialistaModel(
      id: parsedJson['id'] as int,
      nombre: parsedJson['nombre'],
      apellido: parsedJson['apellido'],
      nombreUsuario: parsedJson['nombreUsuario'],
      contrasenia: parsedJson['contrasenia'],
      correo: parsedJson['correo'],
      telefono: parsedJson['telefono'],
      direccion: parsedJson['direccion'],
      // fechaDeNacimiento: parsedJson['fechaNacimiento'] as DateTime,
      genero: parsedJson['genero'],
      // idDepartamento: parsedJson['idDepartamento'] as int,
      razonSocial: parsedJson['razonSocial'],
      rut: parsedJson['rut'],
      nombreFantasia: parsedJson['nombreFantasia'],
      rangoDia: parsedJson['rangoDia'],
      horaDesde: parsedJson['horaDesde'] as int,
      horaHasta: parsedJson['horaHasta'] as int,
      departamentoDisponible: parsedJson['departamentoDisponible'],
      presentacion: parsedJson['presentacion'],
      // idPaquete: parsedJson['idPaquete'] as int,
      oficios: parseOficios(parsedJson),
      // calificacion: parsedJson['calificacion'] as int,
    );
  }

  static List<OficioModel>? parseOficios(Map<String, dynamic> parsedJson) {
    final oficios = parsedJson['oficios'] as List;

    if (oficios.isNotEmpty) {
      final List<OficioModel>? listaOficios = OficioModel.fromList(oficios);
      return listaOficios;
    }
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
      "fechaNacimiento": fechaDeNacimiento?.toIso8601String(),
      "genero": genero,
      "idDepartamento": idDepartamento,
      "razonSocial": razonSocial,
      "rut": rut,
      "nombreFantasia": nombreFantasia,
      "rangoDia": rangoDia,
      "horaDesde": horaDesde,
      "horaHasta": horaHasta,
      "departamentoDisponible": departamentoDisponible,
      "presentacion": presentacion,
      "idPaquete": idPaquete,
      "oficios": Jsonable.toJsonList(oficios),
    };
  }

  static List<EspecialistaModel>? fromList(List<dynamic>? list) {
    var result = <EspecialistaModel>[];
    list?.forEach(
      (item) {
        var especialista = EspecialistaModel.fromJson(item);
        if (especialista != null) {
          result.add(especialista);
        }
      },
    );

    return result;
  }
}
