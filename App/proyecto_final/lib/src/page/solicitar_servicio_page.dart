import 'package:flutter/material.dart';
import 'package:home_life/src/models/cita_model.dart';
import 'package:home_life/src/models/especialista_model.dart';
import 'package:home_life/src/resources/repositories/cita_repository.dart';
import 'package:home_life/src/util/config.dart';
import 'package:home_life/src/util/utils.dart';
import 'package:home_life/src/widget/primary_button.dart';
import 'package:home_life/src/widget/primary_text_field.dart';
import 'package:intl/intl.dart';

import '../util/constants.dart';

class Solicitud extends StatefulWidget {
  _SolicitudState createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
  final _formKey = GlobalKey<FormState>();
  CitaModel cita = CitaModel(ciudad: city, idCliente: idUsuario);
  String? dropdownValue;
  String? _chosenValue1;
  String? _chosenValue2;
  var date;
  TextEditingController _calendarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as EspecialistaModel;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Solicitar servicio'),
        elevation: 0,
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
            padding: const EdgeInsets.all(1.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        radius: 60,
                        child: Text(
                          '${args.nombre![0]}${args.apellido![0]}',
                          style: TextStyle(
                            fontSize: 44,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    args.nombreFantasia ?? '',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${args.oficios?.first.nombre}, ${args.oficios?[1].nombre ?? ''}, ${args.oficios?[2].nombre ?? ''} ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Descripcion: ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: PrimaryTextField(
                      label: 'Descripcion',
                      filled: true,
                      maxLines: 3,
                      onSaved: (String? value) {
                        cita.descripcion = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Seleccione un dia',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
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
                          'Fecha en que desea el servicio',
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
                            firstDate: DateTime.now(),
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
                        cita.fecha = date;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Desde la hora',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            elevation: 0,
                            value: _chosenValue1,
                            items: horas
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
                                  _chosenValue1 = value!;
                                  cita.horaDesde = int.parse(value);
                                },
                              );
                            },
                            icon: Icon(Icons.watch_later_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Hasta la hora',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            elevation: 0,
                            value: _chosenValue2,
                            items: horas
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
                                  _chosenValue2 = value!;
                                  cita.horaHasta = int.parse(value);
                                },
                              );
                            },
                            icon: Icon(Icons.watch_later_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: PrimaryButton(
                        label: 'Solicitar servicio',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            cita.idEspecialista = args.id;
                            CitaRepository().crearCita(cita);
                            Navigator.pushNamed(
                              context,
                              '/codigo',
                            );
                          }
                        }),
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
