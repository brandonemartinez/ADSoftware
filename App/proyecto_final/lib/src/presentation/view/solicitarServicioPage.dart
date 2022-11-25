import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/worker.dart';

class Solicitud extends StatefulWidget {
  _SolicitudState createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  String _chosenValue = _horas().first;

  Widget buildDateTimePicker(String data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.black, width: 1.5),
        ),
        title: Text(data),
        trailing: const Icon(
          Icons.calendar_today,
          color: Colors.black,
        ),
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Worker;
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.asset('assets/profile.jpeg').image,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  args.name + ' ' + args.lastName,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${args.works.first}, ${args.works[1]}, ${args.works[2]} ',
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
                  'Especialidad: ',
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
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('Carpintero'),
                            Spacer(),
                            Icon(Icons.work),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                  child: Container(
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('Arreglar un ropero de madera.'),
                            Spacer(),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),
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
                ValueListenableBuilder<DateTime?>(
                    valueListenable: dateSub,
                    builder: (context, dateVal, child) {
                      return InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                                currentDate: DateTime.now(),
                                initialEntryMode: DatePickerEntryMode.calendar,
                                initialDatePickerMode: DatePickerMode.day,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.fromSwatch(
                                      primarySwatch: Colors.blueGrey,
                                      accentColor: Colors.black,
                                      backgroundColor: Colors.lightBlue,
                                      cardColor: Colors.white,
                                    )),
                                    child: child!,
                                  );
                                });
                            dateSub.value = date;
                          },
                          child: buildDateTimePicker(
                              dateVal != null ? convertDate(dateVal) : ''));
                    }),
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
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton(
                          isExpanded: true,
                          elevation: 0,
                          value: _chosenValue,
                          items: _horas()
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
                                _chosenValue = value!;
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
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton(
                          isExpanded: true,
                          elevation: 0,
                          value: _chosenValue,
                          items: _horas()
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
                                _chosenValue = value!;
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
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/calificar', arguments: args),
                    child: Text('Solicitar servicio'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> _horas() {
  return [
    '9:00',
    '10:00',
    '16:00',
    '18:00',
    '19:00',
    '20:00',
  ];
}
