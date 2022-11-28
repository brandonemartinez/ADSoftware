import 'package:flutter/material.dart';

import '../models/oficio_model.dart';
import '../util/constants.dart';
import '../util/utils.dart';

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
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Seleccione oficio ${widget.index + 1}',
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
                width: 360,
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
                  items: oficios
                      ?.map<DropdownMenuItem<String>>((OficioModel value) {
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
