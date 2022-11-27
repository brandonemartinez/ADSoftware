
import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/resources/remote/http_service.dart';

class ClienteRepository {

  registrarCliente(ClienteModel cliente) async {
    await HttpService().registrarCliente(cliente);
  }
}
