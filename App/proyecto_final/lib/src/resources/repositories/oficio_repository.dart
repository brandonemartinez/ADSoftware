import 'package:home_life/src/models/oficio_model.dart';

import '../remote/http_service.dart';

class OficioRepository {
  OficioRepository();

  Future<List<OficioModel>> listarOficios() {
    return HttpService().listarOficios();
  }
}
