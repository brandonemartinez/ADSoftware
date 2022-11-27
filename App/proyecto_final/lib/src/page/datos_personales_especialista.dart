import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_life/src/models/especialista_model.dart';

import 'package:intl/intl.dart';

import '../util/utils.dart';
import '../widget/primary_button.dart';
import '../widget/primary_text_field.dart';

class DatosPersonalesEspecialista extends StatefulWidget {
  @override
  _DatosPersonalesEspecialistaState createState() =>
      _DatosPersonalesEspecialistaState();
}

class _DatosPersonalesEspecialistaState
    extends State<DatosPersonalesEspecialista> {
  final _formKey = GlobalKey<FormState>();
  EspecialistaModel especialista = EspecialistaModel();
  var date;
  TextEditingController _calendarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _calendarController.text =
        DateFormat('dd/MM/yy').format(date ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
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
                          'Datos personales',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  PrimaryTextField(
                    label: 'Nombre',
                    prefixIcon: Icons.person,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese su nombre';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.nombre = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Apellido',
                    prefixIcon: Icons.person,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese su apellido';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.apellido = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _calendarController,
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: border,
                      prefixIcon: Icon(
                        Icons.calendar_today_rounded,
                      ),
                      label: Text(
                        'Fecha de nacimiento',
                      ),
                    ),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                          locale: const Locale(
                            'es',
                            'ES',
                          ),
                          context: context,
                          initialDate: date ?? DateTime.now(),
                          firstDate: DateTime(
                            1920,
                          ),
                          lastDate: DateTime(
                            2030,
                          ),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                dialogTheme: DialogTheme(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // this is the border radius of the picker
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          });

                      if (newDate == null) return;

                      date = newDate;
                      setState(() {
                        _calendarController.text = DateFormat('dd/MM/yy')
                            .format(date ?? DateTime.now());
                      });
                    },
                    validator: (String? value) {
                      if (value!.isEmpty ||
                          value ==
                              DateFormat('dd/MM/yy').format(DateTime.now())) {
                        return 'Ingrese su fecha de nacimiento';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.fechaDeNacimiento = date;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: "Genero",
                    prefixIcon: Icons.perm_identity,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Seleccione su género';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.genero = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Nombre de usuario',
                    prefixIcon: Icons.person,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese un nombre de usuario';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.nombreUsuario = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: "Contraseña",
                    prefixIcon: Icons.lock,
                    filled: true,
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese una contraseña';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.contrasenia = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: "Repetir contraseña",
                    prefixIcon: Icons.lock,
                    filled: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                    label: 'Siguiente',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(
                          context,
                          '/worker-data',
                          arguments: especialista,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
