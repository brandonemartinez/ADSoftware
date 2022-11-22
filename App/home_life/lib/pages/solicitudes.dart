import 'package:flutter/material.dart';

class Solicitudes extends StatelessWidget {
  final AlertDialog _showDialog = AlertDialog(
    title: Text('Cancelar servicio'),
    content: SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: const [
          Text('Esta seguro que desea cancelar el servicio?'),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text('Confirmar'),
      ),
      TextButton(
        onPressed: () {},
        child: Text('Cancelar'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Solicitudes pendientes'),
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: solicitudes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      child: ListTile(
                        leading: const Icon(
                          Icons.notifications,
                          color: Colors.orange,
                        ),
                        trailing: SizedBox(
                          width: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _showDialog;
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              'Servicio:   ${solicitudes[index].servicio}'),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                  'Oficio:   ${solicitudes[index].oficio}'),
                            ),
                            Row(
                              children: [
                                Text(
                                    'Desde:   ${solicitudes[index].horaDesde}'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Hasta:   ${solicitudes[index].horaHasta}'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                Text(
                                  'Ver detalles',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<SolicitudIndividual> solicitudes = [
  SolicitudIndividual(
    servicio: 'Reparar ropero',
    horaDesde: '9:00',
    horaHasta: '10:00',
    oficio: 'Carpintero',
  ),
  SolicitudIndividual(
    servicio: 'Reparar techo',
    horaDesde: '8:00',
    horaHasta: '12:00',
    oficio: 'Albañil',
  ),
  SolicitudIndividual(
    servicio: 'Construir barra cocina',
    horaDesde: '10:00',
    horaHasta: '16:00',
    oficio: 'Albañil',
  ),
  SolicitudIndividual(
    servicio: 'Reparar biblioteca',
    horaDesde: '17:00',
    horaHasta: '19:00',
    oficio: 'Carpintero',
  ),
];

class SolicitudIndividual {
  final String servicio;
  final String horaDesde;
  final String horaHasta;
  final String oficio;

  SolicitudIndividual({
    required this.horaHasta,
    required this.oficio,
    required this.servicio,
    required this.horaDesde,
  });

  @override
  String toString() => servicio;
}
