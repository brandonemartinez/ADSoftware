import '../models/departamento_model.dart';
import '../models/oficio_model.dart';

class Configuration {
  Configuration({
    this.departamentos,
    this.oficios,
  });

  final List<DepartamentoModel>? departamentos;
  final List<OficioModel>? oficios;
}
