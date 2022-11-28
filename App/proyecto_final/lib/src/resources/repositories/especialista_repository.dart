import '../../models/especialista_model.dart';
import '../remote/http_service.dart';

class EspecialistaRepository {
  EspecialistaRepository();

  registrarEspecialista(EspecialistaModel especialista) async {
    await HttpService().registrarEspecialista(especialista);
  }

  Future<List<EspecialistaModel>> obtenerEspecialistas(String ciudad, String busqueda) async {
    return await HttpService().listarEspecialistasPorCiudad(ciudad, busqueda);
  }
}
