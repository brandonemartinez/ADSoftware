import 'package:home_life/src/models/auth_model.dart';
import 'package:home_life/src/models/loging_model.dart';

import '../remote/http_service.dart';

class LoginRepository {
  LoginRepository();

  Future<LoginModel> login(AuthModel auth) async {
    return await HttpService().login(auth);
  }
}
