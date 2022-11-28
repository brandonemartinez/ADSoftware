import 'package:flutter/material.dart';
import 'package:home_life/src/models/oficio_model.dart';
import 'package:home_life/src/resources/repositories/especialista_repository.dart';
import 'package:home_life/src/util/config.dart';
import 'package:home_life/src/widget/ciudad_dropdown_button.dart';
import 'package:home_life/src/widget/oficio_dropdown_button.dart';
import 'package:home_life/src/widget/primary_button.dart';

import '../models/especialista_model.dart';
import '../util/utils.dart';

class SeleccionOficiosCiudadesPage extends StatefulWidget {
  @override
  _SeleccionOficiosCiudadesPageState createState() =>
      _SeleccionOficiosCiudadesPageState();
}

class _SeleccionOficiosCiudadesPageState
    extends State<SeleccionOficiosCiudadesPage> {
  @override
  void initState() {
    super.initState();
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
        title: Text('Seleccionar ciudades y oficios'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: especialista.cantidadOficios,
                itemBuilder: (context, index) {
                  return OficioDropdownButton(
                    index: index,
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: especialista.cantidadCiudades,
                itemBuilder: (context, index) {
                  return CiudadDropdownButton(
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30.0, right: 30, bottom: 25, top: 20),
          child: PrimaryButton(
            label: 'Finalizar',
            height: 50,
            onPressed: () async {
              String ciudadFinal = armarString();
              List<OficioModel> oficioFinal = armarOficios();
              especialista.departamentoDisponible = ciudadFinal;
              especialista.oficios = oficioFinal;
              await EspecialistaRepository()
                  .registrarEspecialista(especialista);
              Navigator.pushNamed(context, '/signIn');
            },
          ),
        ),
      ),
    );
  }
}
