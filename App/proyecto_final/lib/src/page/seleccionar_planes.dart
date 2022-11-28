import 'package:flutter/material.dart';
import 'package:home_life/src/bloc/plan_bloc.dart';
import 'package:home_life/src/models/plan_model.dart';
import 'package:home_life/src/util/utils.dart';
import 'package:home_life/src/widget/plan_card.dart';

import '../models/especialista_model.dart';

class SeleccionPlanes extends StatefulWidget {
  SeleccionPlanes({
    required this.bloc,
  });

  final PlanBloc bloc;

  @override
  _SeleccionPlanesState createState() => _SeleccionPlanesState();
}

class _SeleccionPlanesState extends State<SeleccionPlanes> {
  @override
  void initState() {
    super.initState();
    widget.bloc.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final especialista =
        ModalRoute.of(context)!.settings.arguments as EspecialistaModel;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Seleccionar plan'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: StreamBuilder<List<PlanModel>>(
              stream: widget.bloc.planStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final List<PlanModel>? planList = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(
                      15.0,
                    ),
                    child: ListView.builder(
                      itemCount: planList?.length,
                      itemBuilder: (context, index) {
                        return PlanCard(
                          title: planList![index].nombre,
                          description: planList[index].descripcion,
                          monthlyPrice: planList[index].precioMensual,
                          anualPrice: planList[index].precioAnual,
                          onTap: () {
                            especialista.idPaquete = planList[index].id;
                            especialista.cantidadOficios = planList[index].cantidadProfesiones;
                            especialista.cantidadCiudades = planList[index].cantidadCiudades;
                            Navigator.pushNamed(context, '/oficios_ciudades',
                                arguments: especialista);
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ),
    );
  }
}

// Column(
// children: [
// PlanCard(
// title: 'Plan individual',
// description:
// 'Podrán elegir hasta 3 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 3 ciudades.',
// monthlyPrice: '3',
// anualPrice: '30',
// ),
// PlanCard(
// title: 'Plan empresa pequeña',
// description:
// 'Podrán elegir hasta 10 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 5 ciudades.',
// monthlyPrice: '3,5',
// anualPrice: '35',
// ),
// PlanCard(
// title: 'Plan enterprise',
// description:
// 'Podrán elegir hasta 20 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 10 ciudades.',
// monthlyPrice: '4',
// anualPrice: '40',
// ),
// PlanCard(
// title: 'Plan ultimate',
// description:
// 'Podrán elegir hasta 20 oficios en los cuales usted sea especialista, y ofrecer sus servicios en todo el país.',
// monthlyPrice: '5',
// anualPrice: '50',
// ),
// SizedBox(
// height: 80,
// ),
// ],
// ),
