import 'package:flutter/material.dart';

class SeleccionarOficios extends StatefulWidget {
  @override
  _SeleccionarOficiosState createState() => _SeleccionarOficiosState();
}

class _SeleccionarOficiosState extends State<SeleccionarOficios> {
  String especialidad1 = _especialidades().first;
  String especialidad2 = _especialidades().first;
  String especialidad3 = _especialidades().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Seleccionar especialidades',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ha seleccionado Plan Individual y puede ofrecer sus servicios en 3 especialidades.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Especialidad 1',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: especialidad1,
                          items: _especialidades()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(
                              () {
                                especialidad1 = value!;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Especialidad 2',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: especialidad2,
                          items: _especialidades()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(
                              () {
                                especialidad2 = value!;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        'Especialidad 3',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: especialidad3,
                          items: _especialidades()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(
                              () {
                                especialidad3 = value!;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Abonar suscripción',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Abonar más tarde',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> _especialidades() {
  return [
    'Albañil',
    'Carpintero',
    'Electricista',
    'Pintor',
    'Mecánico',
    'Niñera',
    'Mantenimiento general',
    'Programador',
    'Yesero',
    'Limpieza',
    'Plomero',
    'Sanitario',
    'Cocinero',
    'Steel Framing',
    'Decorador',
    'Cuidado de personas',
    'Herrero',
    'Soldador',
    'Tornero',
    'Tapicero',
  ];
}
