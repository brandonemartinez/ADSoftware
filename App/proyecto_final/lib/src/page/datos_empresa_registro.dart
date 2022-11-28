import 'package:flutter/material.dart';

import '../models/especialista_model.dart';
import '../util/constants.dart';
import '../util/utils.dart';
import '../widget/primary_button.dart';
import '../widget/primary_text_field.dart';

class RegistroEmpresa extends StatefulWidget {
  @override
  _RegistroEmpresaState createState() => _RegistroEmpresaState();
}

class _RegistroEmpresaState extends State<RegistroEmpresa> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue1 = horas.first.toString();
  String? dropdownValue2 = horas.first.toString();
  String rangoDias = '';
  bool lunes = false;
  bool martes = false;
  bool miercoles = false;
  bool jueves = false;
  bool viernes = false;
  bool sabado = false;
  bool domingo = false;

  agregarDias() {
    rangoDias = '';
    if (lunes) {
      rangoDias += 'Lunes , ';
    }
    if (martes) {
      rangoDias += 'Martes , ';
    }
    if (miercoles) {
      rangoDias += 'Miercoles , ';
    }
    if (jueves) {
      rangoDias += 'Jueves , ';
    }
    if (viernes) {
      rangoDias += 'Viernes , ';
    }
    if (sabado) {
      rangoDias += 'Sabado , ';
    }
    if (domingo) {
      rangoDias += 'Domingo , ';
    }
  }

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
          'Información de la empresa',
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
                  PrimaryTextField(
                    label: 'Razón Social',
                    prefixIcon: Icons.description_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese Razón Social de su empresa';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.razonSocial = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Nombre de fantasía',
                    prefixIcon: Icons.apartment_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese Razón Social de su empresa';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.nombreFantasia = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: "Documento o R.U.T.",
                    prefixIcon: Icons.work_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese Razón Social de su empresa';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.rut = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Presentación',
                    prefixIcon: Icons.description_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese Razón Social de su empresa';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      especialista.presentacion = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Disponibilidad'),
                    ],
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Lunes'),
                        value: lunes,
                        onChanged: (value) {
                          setState(() {
                            lunes = !lunes;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Martes'),
                        value: martes,
                        onChanged: (value) {
                          setState(() {
                            martes = !martes;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Miercoles'),
                        value: miercoles,
                        onChanged: (value) {
                          setState(() {
                            miercoles = !miercoles;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Jueves'),
                        value: jueves,
                        onChanged: (value) {
                          setState(() {
                            jueves = !jueves;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Viernes'),
                        value: viernes,
                        onChanged: (value) {
                          setState(() {
                            viernes = !viernes;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Sábado'),
                        value: sabado,
                        onChanged: (value) {
                          setState(() {
                            sabado = !sabado;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Domingo'),
                        value: domingo,
                        onChanged: (value) {
                          setState(() {
                            domingo = !domingo;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Desde'),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton(
                        value: dropdownValue1,
                        items: horas.map<DropdownMenuItem<String>>(
                          (String hora) {
                            return DropdownMenuItem<String>(
                              value: hora.toString(),
                              child: Text(
                                hora.toString(),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? hora) {
                          setState(
                            () {
                              dropdownValue1 = hora.toString();
                              especialista.horaDesde = int.parse(hora!);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Hasta'),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton(
                        value: dropdownValue2,
                        items: horas.map<DropdownMenuItem<String>>(
                          (String hora) {
                            return DropdownMenuItem<String>(
                              value: hora.toString(),
                              child: Text(
                                hora.toString(),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? hora) {
                          setState(
                            () {
                              dropdownValue2 = hora.toString();
                              especialista.horaHasta = int.parse(hora!);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryButton(
                    label: 'Seleccionar plan',
                    onPressed: () {
                      agregarDias();
                      especialista.rangoDia = rangoDias;
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, '/planes',
                            arguments: especialista);
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
