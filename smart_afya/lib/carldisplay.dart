import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'childworkout.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:smart_afya/carldisplay.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CalendarController {
  late ValueNotifier<DateTime> selectedDay;

  CalendarController({DateTime? initialSelectedDay}) {
    selectedDay = ValueNotifier(initialSelectedDay ?? DateTime.now());
  }

  void dispose() {
    selectedDay.dispose();
  }

  void setSelectedDay(DateTime day) {
    selectedDay.value = day;
  }
}

class CalendarScreen extends StatefulWidget {
  //const CalendarScreen({Key? key}) : super(key: key);
  static bool medStatus = false;
  static bool medReport = false;
  static late List<String> medName = [];
  static late List<String> medMessage = [];
  static late List<String> medType = [];
  static late List<int> medTimesPerDay = [];
  static late List<int> medDays = [];
  static late List<String> medFrequency = [];
  static late List<int> medQuantity = [];
  static late List<TimeOfDay> medTimes = [];
  static bool multitimesperday = false;
  static late List<TimeOfDay> multimedTimes = [];

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarController _calendarController;
  bool medStatus = false;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              disabledBuilder: (context, date, _) {
                if (date.isBefore(DateTime.now())) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  );
                } else {
                  return null;
                }
              },
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              weekendTextStyle: const TextStyle(color: Colors.red),
              holidayTextStyle: const TextStyle(color: Colors.red),
              todayDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            locale: 'en_US',
            focusedDay: _calendarController.selectedDay.value,
            firstDay:
                DateTime.utc(DateTime.now().year, DateTime.now().month, 1),
            lastDay:
                DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 0),
            onDaySelected: (date, events) {
              _calendarController.setSelectedDay(date);
              setState(() {
                // Update the focusedDay to the selected day
                _calendarController.selectedDay.value = date;
              });
            },
          ),
          Expanded(
            child: Center(
              child: CalendarScreen.medStatus
                  ? SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://t3.ftcdn.net/jpg/02/33/66/28/360_F_233662828_juRR3hWcqDXEdj4n7qsOtupQ0y7AULJ4.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upcoming Medications',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'serif',
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  for (int i = 0;
                                      i < CalendarScreen.medName.length;
                                      i++)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                title: Text(
                                                  'Reminder Details',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Medicine Name',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen.medName[i],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Notification Message',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen
                                                          .medMessage[i],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Type of medicine',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen.medType[i],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Quantity',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen
                                                          .medQuantity[i]
                                                          .toString(),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Number of times per day',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen
                                                          .medTimesPerDay[i]
                                                          .toString(),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Number of days',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen.medDays[i]
                                                          .toString(),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Frequency of take',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      CalendarScreen
                                                          .medFrequency[i],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'Times for notifications',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    CalendarScreen
                                                            .multitimesperday
                                                        ? ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                CalendarScreen
                                                                    .multimedTimes
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int j) {
                                                              return Text(
                                                                  '${CalendarScreen.multimedTimes[j]}');
                                                            },
                                                          )
                                                        : Text(
                                                            '${CalendarScreen.medTimes[i]}'),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${i + 1}. ${CalendarScreen.medName[i]}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'serif',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                CalendarScreen.medMessage[i],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                      ],
                                    ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChildWorkout()),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.receipt,
                                          color: Colors.green,
                                          size: 28,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Reports',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'serif',
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_hospital,
                          size: 48,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No medicine added yet',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddMedicineForm());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class AddMedicineForm extends StatefulWidget {
  @override
  _AddMedicineFormState createState() => _AddMedicineFormState();
}

class _AddMedicineFormState extends State<AddMedicineForm> {
  late String _name;
  late String _type = '';
  late int _quantity;
  late String _notificationMessage;
  late int _timesPerDay = 3;
  late int _medDayss;
  late String _frequency;
  List<TimeOfDay> _times = [];
  List<TimeOfDay> _multitimes = [];
  bool _isMultipleTimesPerDay = false;

  _AddMedicineFormState() {
    _times = List.generate(_timesPerDay, (index) => TimeOfDay.now());
    _multitimes = List.generate(_timesPerDay, (index) => TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Medicine'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) => _name = value,
            ),
            SizedBox(height: 16.0),
            Text('Type of Medicine'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _type = 'Bottle'),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/2932/2932643.png',
                    width: 64.0,
                    height: 64.0,
                    color: _type == 'Bottle' ? Colors.blue : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _type = 'Syringe'),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/9993/9993649.png',
                    width: 64.0,
                    height: 64.0,
                    color: _type == 'Syringe' ? Colors.blue : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _type = 'Tablet'),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/4840/4840430.png',
                    width: 64.0,
                    height: 64.0,
                    color: _type == 'Tablet' ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantity (${_type == 'Tablet' ? 'Pieces' : 'ml'})',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => _quantity = int.tryParse(value) ?? 0,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Notification Message',
              ),
              onChanged: (value) => _notificationMessage = value,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Number of times per day',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _timesPerDay = int.tryParse(value) ?? 0;
                _isMultipleTimesPerDay = (_timesPerDay > 1);
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Number of days for the medication',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => _medDayss = int.tryParse(value) ?? 0,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Frequency (e.g. every 8 hours)',
              ),
              onChanged: (value) => _frequency = value,
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < _timesPerDay; i++)
              ListTile(
                title: Text('Time ${i + 1}'),
                trailing: TextButton(
                  onPressed: () async {
                    final timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (timeOfDay != null) {
                      setState(() {
                        _times[i] = timeOfDay;
                        if (_isMultipleTimesPerDay) _multitimes[i] = timeOfDay;
                      });
                    }
                  },
                  child: _isMultipleTimesPerDay
                      ? Text(_multitimes[i].format(context))
                      : Text(_times[i].format(context)),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Check if _type has been initialized before accessing its value
            if (_type != null) {
              // Schedule notifications at the selected times
              final flutterLocalNotificationsPlugin =
                  FlutterLocalNotificationsPlugin();
              final initializationSettingsAndroid =
                  AndroidInitializationSettings('app_icon');
              final initializationSettingsIOS = IOSInitializationSettings();
              final initializationSettings = InitializationSettings(
                  android: initializationSettingsAndroid,
                  iOS: initializationSettingsIOS);
              await flutterLocalNotificationsPlugin
                  .initialize(initializationSettings);

              for (var i = 0; i < _times.length; i++) {
                final notificationTime = DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  _times[i].hour,
                  _times[i].minute,
                );
                final androidPlatformChannelSpecifics =
                    AndroidNotificationDetails(
                  //'channelId',
                  'channelName',
                  'channelDescription',
                  importance: Importance.high,
                  priority: Priority.high,
                  playSound: true,
                  timeoutAfter: 5000,
                );
                final iOSPlatformChannelSpecifics = IOSNotificationDetails();
                final platformChannelSpecifics = NotificationDetails(
                  android: androidPlatformChannelSpecifics,
                  iOS: iOSPlatformChannelSpecifics,
                );
                await flutterLocalNotificationsPlugin.schedule(
                  i,
                  'Medicine Reminder',
                  _notificationMessage,
                  notificationTime,
                  platformChannelSpecifics,
                );
              }

              // Show an alert dialog to let the user know that the notifications have been scheduled successfully
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('Success'),
                    ],
                  ),
                  content: Text('Notifications scheduled successfully'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          //Navigator.of(context).pop();
                          bool medStatus = true;
                          CalendarScreen.medStatus = true;
                          CalendarScreen.medReport = true;
                          CalendarScreen.medName.add(_name);
                          CalendarScreen.medQuantity.add(_quantity);
                          CalendarScreen.medType.add(_type);
                          CalendarScreen.medTimesPerDay.add(_timesPerDay);
                          CalendarScreen.medTimes = (_times);
                          CalendarScreen.multimedTimes = (_multitimes);
                          CalendarScreen.medFrequency.add(_frequency);
                          CalendarScreen.medDays.add(_medDayss);
                          CalendarScreen.medMessage.add(_notificationMessage);
                          CalendarScreen.multitimesperday =
                              _isMultipleTimesPerDay;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalendarScreen(),
                            ),
                          );
                        });
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
