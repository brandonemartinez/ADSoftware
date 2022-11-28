import 'package:flutter/material.dart';
import 'package:home_life/src/util/config.dart';

import '../models/oficio_model.dart';
import '../util/constants.dart';

class OficioDropdownButton extends StatefulWidget {
  OficioDropdownButton({required this.index});

  final int index;

  @override
  _CustomDropdownButton createState() => _CustomDropdownButton();
}

class _CustomDropdownButton extends State<OficioDropdownButton> {
  String? dropdownValue = oficios?.first.nombre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Seleccione oficio ${widget.index}'),
          ],
        ),
        Row(
          children: [
            DropdownButton(
              value: dropdownValue,
              items:
                  oficios?.map<DropdownMenuItem<String>>((OficioModel value) {
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
                setState(
                  () {
                    dropdownValue = value!;
                    oficiosSeleccionados?.insert(widget.index, value);
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
