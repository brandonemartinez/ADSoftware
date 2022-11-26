import 'dart:convert';

import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/resources/remote/http_service.dart';

class ClienteRepository {

  registrarCliente(ClienteModel cliente) async {
    var res = await HttpService().registrarCliente(cliente);
    var body = jsonDecode(res.body);
    if(body.statusCode == 200){
      print ('Success');
    } else {
      throw Exception('Failed to create course.');
    }
  }
}
