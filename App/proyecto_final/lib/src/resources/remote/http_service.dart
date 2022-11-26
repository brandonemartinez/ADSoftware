import 'dart:convert';

import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/util/constants.dart';
import 'package:http/http.dart' as http;

class HttpService {
  registrarCliente(ClienteModel cliente) async {
    var fullUrl = kBaseUrl + 'Usuario/Cliente';
    final response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cliente.toJson()),
    );

    if (response.statusCode == 200){
      return ClienteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }
}
