import 'dart:convert';

import 'package:home_life/src/models/auth_model.dart';
import 'package:home_life/src/models/cita_model.dart';
import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/models/departamento_model.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/models/loging_model.dart';
import 'package:home_life/src/models/oficio_model.dart';
import 'package:home_life/src/models/plan_model.dart';
import 'package:home_life/src/util/config.dart';
import 'package:home_life/src/util/constants.dart';
import 'package:http/http.dart' as http;

class HttpService {
  registrarCliente(ClienteModel cliente) async {
    var _fullUrl = kBaseUrl + 'Usuario/Cliente';
    final response = await http.post(
      Uri.parse(_fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cliente.toJson()),
    );

    if (response.statusCode == 201) {
      print('Usuario creado');
    } else {
      throw Exception(response.body);
    }
  }

  registrarEspecialista(EspecialistaModel especialista) async {
    var _fullUrl = kBaseUrl + 'Usuario/Especialista';
    final response = await http.post(
      Uri.parse(_fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(especialista.toJson()),
    );

    if (response.statusCode == 201) {
      print('Especialista creado');
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<EspecialistaModel>> listarEspecialistasPorCiudad(
      String ciudad, String busqueda) async {
    var _fullUrl = kBaseUrl +
        'Especialista/Filtrado?Localidad=${ciudad}&Busqueda=${busqueda}';
    final response = await http.get(
      Uri.parse(
        _fullUrl,
      ),
    );
    if (response.statusCode == 200) {
      print("Especialistas por ciudad cargados");
      final body = jsonDecode(response.body);

      final List<EspecialistaModel> especialistaList = body
          .map<EspecialistaModel>(
            (e) => EspecialistaModel.fromJson(e),
          )
          .toList();
      return especialistaList;
    } else {
      throw Exception('Error especialistas.' + response.statusCode.toString());
    }
  }

  Future<EspecialistaModel> obtenerEspecialistasPorId(int id) async {
    var _fullUrl = kBaseUrl + 'Especialista/${id}';
    final response = await http.get(
      Uri.parse(
        _fullUrl,
      ),
    );
    if (response.statusCode == 200) {
      print("Especialista por id cargado");
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return EspecialistaModel.fromJson(body);
    } else {
      throw Exception(
          'Error especialista por id.' + response.statusCode.toString());
    }
  }

  Future<List<DepartamentoModel>> listarDepartamentos() async {
    var _fullUrl = kBaseUrl + 'Departamento';
    final response = await http.get(
      Uri.parse(
        _fullUrl,
      ),
    );
    if (response.statusCode == 200) {
      print("Departamentos cargados");
      final body = jsonDecode(response.body) as List;

      return body.map<DepartamentoModel>((e) {
        final departamento = e as Map<String, dynamic>;
        return DepartamentoModel.fromJson(departamento);
      }).toList();
    } else {
      throw Exception('Error departamentos.');
    }
  }

  Future<List<PlanModel>> listarPlanes() async {
    var _fullUrl = kBaseUrl + 'Plan';
    final response = await http.get(
      Uri.parse(
        _fullUrl,
      ),
    );
    if (response.statusCode == 201) {
      print("Planes cargados");
      final body = jsonDecode(response.body);

      final List<PlanModel> planList = body['result']
          .map<PlanModel>(
            (e) => PlanModel.fromJson(e),
          )
          .toList();
      return planList;
    } else {
      throw Exception('Error planes.' + response.statusCode.toString());
    }
  }

  Future<List<OficioModel>> listarOficios() async {
    var _fullUrl = kBaseUrl + 'Oficio';
    final response = await http.get(
      Uri.parse(
        _fullUrl,
      ),
    );
    if (response.statusCode == 200) {
      print("Oficios cargados");
      final body = jsonDecode(response.body);

      final List<OficioModel> oficioList = body
          .map<OficioModel>(
            (e) => OficioModel.fromJson(e),
          )
          .toList();
      return oficioList;
    } else {
      throw Exception('Error oficios.' + response.statusCode.toString());
    }
  }

  crearCita(CitaModel cita) async {
    var _fullUrl = kBaseUrl + 'Cita';
    final response = await http.post(
      Uri.parse(_fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cita.toJson()),
    );

    if (response.statusCode == 201) {
      print('Cita creada');
    } else {
      throw Exception(response.body);
    }
  }

  login(AuthModel auth) async {
    var _fullUrl = kBaseUrl + 'Auth/Login';
    final response = await http.post(
      Uri.parse(_fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(auth.toJson()),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Login exitoso.');
      signedIn = true;
      final LoginModel login = LoginModel.fromJson(body);
      rol = login.rol!;
      idUsuario = login.idUser!;
      return login;
    } else {
      throw Exception(response.body);
    }
  }
}
