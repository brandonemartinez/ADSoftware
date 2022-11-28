import 'package:flutter/material.dart';

import '../models/departamento_model.dart';
import '../util/constants.dart';
import '../util/utils.dart';

class CiudadDropdownButton extends StatefulWidget {
  CiudadDropdownButton({
    required this.index,
  });

  final int index;

  @override
  _CiudadDropdownButtonState createState() => _CiudadDropdownButtonState();
}

class _CiudadDropdownButtonState extends State<CiudadDropdownButton> {
  String? dropdownValue = departamentos?.first.nombre;
  String? ciudadDropdownValue;
  List<String> _ciudades = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Seleccione ciudad ${widget.index + 1}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 60,
                width: 170,
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
                  value: dropdownValue,
                  items: departamentos
                      ?.map<DropdownMenuItem<String>>((DepartamentoModel value) {
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
                        dropdownValue = value!;
                        _ciudades = getCiudades(value);
                        ciudadDropdownValue = _ciudades.first;
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 60,
                width: 170,
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
                  value: ciudadDropdownValue,
                  items: _ciudades.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          top: 10,
                        ),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(
                      () {
                        ciudadDropdownValue = value!;
                        ciudadesSeleccionadas?.insert(widget.index, value);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
