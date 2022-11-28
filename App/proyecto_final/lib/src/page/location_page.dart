import 'package:flutter/material.dart';
import 'package:home_life/src/models/departamento_model.dart';
import 'package:home_life/src/util/utils.dart';

import '../util/constants.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String dropdownValue1 = departamentos?.first.nombre ?? '';
  String? dropdownValue2 = null;

  @override
  Widget build(BuildContext context) {
    List<String?> _ciudades = getCiudades(dropdownValue1);
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   title: Text(
      //     'Seleccione una ubicación',
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.black,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Buscar un especialista en: ',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          dropdownValue2 ?? '',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                'Seleccione departamento',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: primaryColor,
                      ),
                      borderRadius: borderRadius,
                    ),
                  ),
                  child: DropdownButton(
                    underline: Container(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    isExpanded: true,
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(Icons.arrow_drop_down),
                    ),
                    value: dropdownValue1,
                    items: departamentos?.map<DropdownMenuItem<String>>(
                        (DepartamentoModel value) {
                      return DropdownMenuItem<String>(
                        value: value.nombre,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 10,
                          ),
                          child: Text(value.nombre!),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(
                        () {
                          dropdownValue1 = value!;
                          state = value;
                          _ciudades = getCiudades(value);
                          dropdownValue2 = _ciudades.first;
                          city = dropdownValue2;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Seleccione ciudad',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: primaryColor,
                      ),
                      borderRadius: borderRadius,
                    ),
                  ),
                  child: DropdownButton(
                    underline: Container(
                      color: Colors.white,
                    ),
                    borderRadius: borderRadius,
                    isExpanded: true,
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(Icons.arrow_drop_down),
                    ),
                    value: dropdownValue2,
                    items:
                        _ciudades.map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 10,
                          ),
                          child: Text(value!),
                        ),
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
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List<String> _departamentos() {
//   return [
//     'Artigas',
//     'Canelones',
//     'Cerro Largo',
//     'Colonia',
//     'Durazno',
//     'Flores',
//     'Florida',
//     'Lavalleja',
//     'Maldonado',
//     'Montevideo',
//     'Paysandu',
//     'Rio Negro',
//     'Rivera',
//     'Rocha',
//     'San Jose',
//     'Salto',
//     'Soriano',
//     'Tacuarembo',
//     'Treinta y tres',
//   ];
// }

// List<String> _ciudades() {
//   return [
//     'Bella Union',
//     'Maldonado',
//     'Punta del Este',
//     'Minas',
//     'San Carlos',
//     'Fray Bentos',
//     'Salto',
//   ];
// }

// List<String> _ciudades2(String state) {
//   switch (state) {
//     case 'Maldonado':
//       return [
//         'Aigua',
//         'Maldonado',
//         'Punta del Este',
//         'Pan de Azucar',
//         'San Carlos',
//         'Piriapolis',
//         'Las Flores',
//       ];
//     case 'Salto':
//       return [
//         'Salto Grande',
//         'Villa Constitución',
//         'Guichón',
//         'Cuareim',
//         'Salto',
//       ];
//     default:
//       return [
//         'No disponible',
//       ];
//   }
// }
