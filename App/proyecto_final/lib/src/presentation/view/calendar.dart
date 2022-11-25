import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  var _focusedCalendarDate = DateTime.now();
  DateTime? selectedCalendarDate;

  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Event'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTextField(controller: titleController, hint: 'Enter Title'),
            const SizedBox(
              height: 20.0,
            ),
            buildTextField(
                controller: descpController, hint: 'Enter Description'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter title & description'),
                    duration: Duration(seconds: 3),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                setState(() {
                  if (mySelectedEvents[selectedCalendarDate] != null) {
                    mySelectedEvents[selectedCalendarDate]?.add(MyEvents(
                        eventTitle: titleController.text,
                        eventDescp: descpController.text));
                  } else {
                    mySelectedEvents[selectedCalendarDate!] = [
                      MyEvents(
                          eventTitle: titleController.text,
                          eventDescp: descpController.text)
                    ];
                  }
                });

                titleController.clear();
                descpController.clear();

                Navigator.pop(context);
                return;
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: ElevatedButton(
        onPressed: _showAddEventDialog,
        child: Text('+'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Agenda',
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
      body: Column(
        children: [
          Container(
            child: TableCalendar(
              eventLoader: _listOfDayEvents,
              headerStyle: HeaderStyle(formatButtonVisible: false),
              locale: 'es_UY',
              firstDay: DateTime.utc(2020, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (currentSelectedDate) {
                // as per the documentation 'selectedDayPredicate' needs to determine current selected day.
                return (isSameDay(selectedCalendarDate!, currentSelectedDate));
              },
              onDaySelected: (selectedDay, focusedDay) {
                // as per the documentation
                if (!isSameDay(selectedCalendarDate, selectedDay)) {
                  setState(() {
                    selectedCalendarDate = selectedDay;
                    _focusedCalendarDate = focusedDay;
                  });
                }
              },
            ),
          ),
          ..._listOfDayEvents(selectedCalendarDate!).map(
            (myEvents) => InkWell(
              onTap: (){},
              child: ListTile(
                leading: const Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Servicio:   ${myEvents.eventTitle}'),
                ),
                subtitle: Text('Hora:   ${myEvents.eventDescp}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyEvents {
  final String eventTitle;
  final String eventDescp;

  MyEvents({required this.eventTitle, required this.eventDescp});

  @override
  String toString() => eventTitle;
}
