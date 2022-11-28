import 'package:home_life/src/models/cita_model.dart';
import 'package:home_life/src/resources/remote/http_service.dart';

class CitaRepository {
  CitaRepository();

  crearCita(CitaModel cita) async {
    await HttpService().crearCita(cita);
  }
}
