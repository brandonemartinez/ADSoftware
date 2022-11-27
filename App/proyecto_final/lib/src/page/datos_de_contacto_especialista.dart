import 'package:flutter/material.dart';
import 'package:home_life/src/models/especialista_model.dart';

import '../models/departamento_model.dart';
import '../util/constants.dart';
import '../util/utils.dart';
import '../widget/primary_button.dart';
import '../widget/primary_text_field.dart';

class DatosDeContactoEspecialista extends StatefulWidget {
  @override
  _DatosDeContactoEspecialista createState() => _DatosDeContactoEspecialista();
}

class _DatosDeContactoEspecialista extends State<DatosDeContactoEspecialista> {
  String dropdownValue = departamentos?.first.nombre ?? '';
  final _formKey = GlobalKey<FormState>();

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
        elevation: 0,
        title: Text(
          'Registro de especialista',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Datos de contacto',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  PrimaryTextField(
                    label: 'E-mail',
                    prefixIcon: Icons.alternate_email,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.correo = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Teléfono',
                    prefixIcon: Icons.phone,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese un número de teléfono';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.telefono = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
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
                      value: dropdownValue,
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
                        setState(
                          () {
                            dropdownValue = value!;
                            especialista.idDepartamento =
                                getIdDepartamentoByName(value);
                          },
                        );
                      },
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // PrimaryTextField(
                  //   label: 'Departamento',
                  //   prefixIcon: Icons.home_rounded,
                  //   filled: true,
                  //   validator: (String? value) {
                  //     if (value!.isEmpty) {
                  //       return 'Ingrese un departamento';
                  //     }
                  //     return null;
                  //   },
                  //   onSaved: (String? value) {
                  //     especialista.idDepartamento = int.parse(value!);
                  //   },
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Dirección',
                    prefixIcon: Icons.home_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese una dirección';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.direccion = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (context) {}),
                      Text('Acepto los términos y condiciones'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                      label: 'Registrarme',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushNamed(context, '/empresa',
                              arguments: especialista);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}