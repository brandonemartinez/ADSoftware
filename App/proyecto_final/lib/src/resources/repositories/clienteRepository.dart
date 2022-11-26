import 'dart:convert';

import 'package:home_life/src/resources/remote/http_service.dart';

class ClienteRepository {

  Future<String> registrarCliente(data) async {
    var res = await HttpService().postData(data, 'Usuario/Cliente');
    var body = jsonDecode(res.body);
    if(body['success']){
      return 'Success';
    }
    return 'Error';
  }
}
