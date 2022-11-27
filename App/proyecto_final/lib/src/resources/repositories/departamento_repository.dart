import 'package:home_life/src/models/departamento_model.dart';

import '../remote/http_service.dart';

class DepartamentoRepository {
  Future<List<DepartamentoModel>> listarDepartamentos() {
    return HttpService().listarDepartamentos();
  }
}
