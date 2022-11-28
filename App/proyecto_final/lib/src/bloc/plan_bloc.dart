import 'dart:async';

import 'package:home_life/src/models/plan_model.dart';
import 'package:home_life/src/resources/repositories/plan_repository.dart';

class PlanBloc {
  PlanBloc();

  final List<PlanModel> _planes = <PlanModel>[];
  final StreamController<List<PlanModel>> _streamController =
  StreamController<List<PlanModel>>.broadcast();

  void dispose() {
    _streamController.close();
  }

  Future<void> initialize() async {
    try {
      final List<PlanModel> _planes = await PlanRepository().listarPlanes();
      await buildPlanList(_planes.toList());
      _streamController.add(plan);
    } catch (error) {
      print(error);
    }
  }

  Future<void> buildPlanList(List<PlanModel> planes) async {
    _planes.addAll(planes);
  }

  List<PlanModel> get plan => _planes;

  Stream<List<PlanModel>> get planStream => _streamController.stream;
}