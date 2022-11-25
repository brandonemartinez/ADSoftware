import 'package:flutter/material.dart';

class HistorialPagos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Historial de pagos'),
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
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              'Servicio:   ${solicitudes[index].concepto}'),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Oficio:   ${solicitudes[index].oficio}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Fecha:   ${solicitudes[index].fecha}'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Monto:   ${solicitudes[index].monto}',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,
                                ),
                                Text(
                                  'Ver más',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
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

List<PagoRegistrado> solicitudes = [
  PagoRegistrado(
    concepto: 'Reparar ropero',
    oficio: 'Carpintería',
    fecha: '12/11/2022',
    monto: '\$UYU 1500',
  ),
  PagoRegistrado(
    concepto: 'Reparar techo',
    oficio: 'Albañilería',
    fecha: '03/11/2022',
    monto: '\$UYU 4500',
  ),
  PagoRegistrado(
    concepto: 'Construir barra para cocina',
    oficio: 'Carpintería',
    fecha: '02/11/2022',
    monto: '\$UYU 5000',
  ),
  PagoRegistrado(
    concepto: 'Reparar biblioteca',
    oficio: 'Carpintería',
    fecha: '19/10/2022',
    monto: '\$UYU 1200',
  ),
];

class PagoRegistrado {
  final String concepto;
  final String oficio;
  final String fecha;
  final String monto;

  PagoRegistrado({
    required this.fecha,
    required this.monto,
    required this.concepto,
    required this.oficio,
  });

  @override
  String toString() => concepto;
}
