import 'package:flutter/material.dart';
import 'package:home_life/utils.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String dropdownValue1 = _departamentos().first;
  String dropdownValue2 = _ciudades().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Seleccione una ubicación',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Buscar un especialista en: ' + (city ?? ''),
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Seleccione departamento',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: state ?? dropdownValue1,
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
                      dropdownValue1 = value!;
                      state = value;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Seleccione ciudad',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: city ?? dropdownValue2,
                items:
                    _ciudades().map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(
                    () {
                      dropdownValue2 = value!;
                      city = value;
                    },
                  );
                },
              ),
            ),
            city != null
                ? ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/search'),
                    child: Text('Continuar'),
                  )
                : ElevatedButton(
                    onPressed: null,
                    child: Text('Continuar'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.grey,
                      ),
                    ),
                  ),
          ],
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

List<String> _ciudades2(String state) {
  switch (state) {
    case 'Maldonado':
      return [
        'Aigua',
        'Maldonado',
        'Punta del Este',
        'Pan de Azucar',
        'San Carlos',
        'Piriapolis',
        'Las Flores',
      ];
    case 'Salto':
      return [
        'Salto Grande',
        'Villa Constitución',
        'Guichón',
        'Cuareim',
        'Salto',
      ];
    default:
      return [
        'No disponible',
      ];
  }
}
