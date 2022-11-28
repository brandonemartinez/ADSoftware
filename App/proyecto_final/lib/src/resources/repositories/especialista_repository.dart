import '../../models/especialista_model.dart';
import '../remote/http_service.dart';

class EspecialistaRepository {
  EspecialistaRepository();

  registrarEspecialista(EspecialistaModel especialista) async {
    await HttpService().registrarEspecialista(especialista);
  }
}
