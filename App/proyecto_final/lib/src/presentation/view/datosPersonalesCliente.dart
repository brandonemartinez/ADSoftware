import 'package:flutter/material.dart';

import 'package:home_life/src/presentation/widget/primaryTextField.dart';
import 'package:intl/intl.dart';

import '../../core/utils/utils.dart';
import '../widget/primaryButton.dart';

class DatosPersonalesCliente extends StatefulWidget {
  @override
  _DatosPersonalesClienteState createState() => _DatosPersonalesClienteState();
}

class _DatosPersonalesClienteState extends State<DatosPersonalesCliente> {
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
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Apellido',
                  prefixIcon: Icons.person,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
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
                      _calendarController.text =
                          DateFormat('dd/MM/yy').format(date ?? DateTime.now());
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: "Genero",
                  prefixIcon: Icons.perm_identity,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Nombre de usuario',
                  prefixIcon: Icons.person,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: "Contraseña",
                  prefixIcon: Icons.lock,
                  filled: true,
                  obscureText: true,
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
                  onPressed: () => Navigator.pushNamed(context, '/client-data'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
