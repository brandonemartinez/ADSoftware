import 'package:home_life/src/models/plan_model.dart';

import '../remote/http_service.dart';

class PlanRepository {
  PlanRepository();

  Future<List<PlanModel>> listarPlanes() {
    return HttpService().listarPlanes();
  }
}
