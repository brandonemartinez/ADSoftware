import 'package:flutter/material.dart';
import 'package:home_life/src/models/cliente_model.dart';

import 'package:intl/intl.dart';

import '../util/utils.dart';
import '../widget/primaryButton.dart';
import '../widget/primaryTextField.dart';

class DatosPersonalesCliente extends StatefulWidget {
  @override
  _DatosPersonalesClienteState createState() => _DatosPersonalesClienteState();
}

class _DatosPersonalesClienteState extends State<DatosPersonalesCliente> {
  final _formKey = GlobalKey<FormState>();
  ClienteModel cliente = ClienteModel();
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
          'Registro de cliente',
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
                      cliente.nombre = value;
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
                      cliente.apellido = value;
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
                            2021,
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
                      if (value!.isEmpty || value == DateFormat('dd/MM/yy').format(DateTime.now())) {
                        return 'Ingrese su fecha de nacimiento';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      cliente.fechaNacimiento = date;
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
                      cliente.genero = value;
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
                      cliente.nombreUsuario = value;
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
                      cliente.contrasenia = value;
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
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese otra vez la contraseña';
                      }
                      return null;
                    },
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
                            context, '/client-data', arguments: cliente);
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
