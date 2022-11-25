import 'package:flutter/material.dart';

class SeleccionarCiudades extends StatefulWidget {
  @override
  _SeleccionarCiudadesState createState() => _SeleccionarCiudadesState();
}

class _SeleccionarCiudadesState extends State<SeleccionarCiudades> {
  String dropdownDepartamento1 = _departamentos().first;
  String dropdownCiudad1 = _ciudades().first;
  String dropdownDepartamento2 = _departamentos().first;
  String dropdownCiudad2 = _ciudades().first;
  String dropdownDepartamento3 = _departamentos().first;
  String dropdownCiudad3 = _ciudades().first;

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
          'Seleccionar ciudades de disponibilidad',
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
                      'Ha seleccionado Plan Individual y puede ofrecer sus servicios en 3 ciudades',
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
                        'Ciudad 1',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Seleccione departamento',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownDepartamento1,
                          items: _departamentos()
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
                                dropdownDepartamento1 = value!;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Seleccione ciudad',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownCiudad1,
                          items: _ciudades()
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
                                dropdownCiudad1 = value!;
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
                        'Ciudad 2',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Seleccione departamento',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownDepartamento2,
                          items: _departamentos()
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
                                dropdownDepartamento2 = value!;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Seleccione ciudad',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownCiudad2,
                          items: _ciudades()
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
                                dropdownCiudad2 = value!;
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
                        'Ciudad 3',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Seleccione departamento',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownDepartamento3,
                          items: _departamentos()
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
                                dropdownDepartamento3 = value!;
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Seleccione ciudad',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: dropdownCiudad3,
                          items: _ciudades()
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
                                dropdownCiudad3 = value!;
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
                onPressed: () =>
                    Navigator.pushNamed(context, '/select-oficios'),
                child: Text(
                  'Siguiente',
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> _departamentos() {
  return [
    'Artigas',
    'Canelones',
    'Cerro Largo',
    'Colonia',
    'Durazno',
    'Flores',
    'Florida',
    'Lavalleja',
    'Maldonado',
    'Montevideo',
    'Paysandu',
    'Rio Negro',
    'Rivera',
    'Rocha',
    'San Jose',
    'Salto',
    'Soriano',
    'Tacuarembo',
    'Treinta y tres',
  ];
}

List<String> _ciudades() {
  return [
    'Bella Union',
    'Maldonado',
    'Punta del Este',
    'Minas',
    'San Carlos',
    'Fray Bentos',
    'Salto',
  ];
}
