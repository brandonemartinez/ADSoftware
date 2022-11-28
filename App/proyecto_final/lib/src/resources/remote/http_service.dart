import 'dart:convert';

import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/models/departamento_model.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/models/oficio_model.dart';
import 'package:home_life/src/models/plan_model.dart';
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
      throw Exception(response.statusCode);
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
}
