import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GrandyWorkout extends StatefulWidget {
  @override
  _GrandyWorkoutState createState() => _GrandyWorkoutState();
}

class _GrandyWorkoutState extends State<GrandyWorkout> {
  bool _isPaused = true;
  int _counter = 21;
  Timer? _timer;

  void _startTimer() {
    if (_isPaused) {
      _isPaused = false;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _isPaused = true;
            _timer?.cancel();
          }
        });
      });
    } else {
      _isPaused = true;
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Grandy Workouts',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: Text(
                        'Please consult a professional before performing these exercises!',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Waist pumps', 'assets/s3.gif', 'assets/s3.png');
                },
                child: _buildExerciseCard('Waist pumps', 'assets/s3.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Bend Arm Charges', 'assets/s20.gif', 'assets/s20.png');
                },
                child: _buildExerciseCard('Bend Arm Charges', 'assets/s20.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Seat Charge', 'assets/s15.gif', 'assets/s15.png');
                },
                child: _buildExerciseCard('Seat Charge', 'assets/s15.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Seat Leg Charge', 'assets/s14.gif', 'assets/s14.png');
                },
                child: _buildExerciseCard('Seat Leg Charge', 'assets/s14.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Seat Stretches', 'assets/s13.gif', 'assets/s13.png');
                },
                child: _buildExerciseCard('Seat Stretches', 'assets/s13.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Seat Stands', 'assets/s12.gif', 'assets/s12.png');
                },
                child: _buildExerciseCard('Seat Stands', 'assets/s12.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Shoulder Charges', 'assets/s11.gif', 'assets/s11.png');
                },
                child: _buildExerciseCard('Shoulder Charges', 'assets/s11.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Leg band Twists', 'assets/s18.gif', 'assets/s18.png');
                },
                child: _buildExerciseCard('Leg band Twists', 'assets/s18.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Leg Stretch', 'assets/s17.gif', 'assets/s17.png');
                },
                child: _buildExerciseCard('Leg Stretch', 'assets/s17.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Leg Rolls', 'assets/s16.gif', 'assets/s16.png');
                },
                child: _buildExerciseCard('Leg Rolls', 'assets/s16.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Back Charges', 'assets/s10.gif', 'assets/s10.png');
                },
                child: _buildExerciseCard('Back Charges', 'assets/s10.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Shoulder twists', 'assets/s8.gif', 'assets/s8.png');
                },
                child: _buildExerciseCard('Shoulder twists', 'assets/s8.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Low leg stretch', 'assets/s9.gif', 'assets/s9.png');
                },
                child: _buildExerciseCard('Low leg stretch', 'assets/s9.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Top Twists', 'assets/s7.gif', 'assets/s7.png');
                },
                child: _buildExerciseCard('Top Twists', 'assets/s7.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Arm Charges', 'assets/s6.gif', 'assets/s6.png');
                },
                child: _buildExerciseCard('Arm Charges', 'assets/s6.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Leg up twists', 'assets/s5.gif', 'assets/s5.png');
                },
                child: _buildExerciseCard('Leg up twists', 'assets/s5.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Neck twist', 'assets/s4.gif', 'assets/s4.png');
                },
                child: _buildExerciseCard('Neck twist', 'assets/s4.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Joggng', 'assets/s1.gif', 'assets/s1.png');
                },
                child: _buildExerciseCard('Jogging', 'assets/s1.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Leg pumps', 'assets/jog.gif', 'assets/jog.png');
                },
                child: _buildExerciseCard('Leg pumps', 'assets/jog.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Right Leg pumps', 'assets/jmps.gif', 'assets/jmps.png');
                },
                child: _buildExerciseCard('Right Leg pumps', 'assets/jmps.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Waist back pumps', 'assets/s2.gif', 'assets/s2.png');
                },
                child: _buildExerciseCard('Waist back pumps', 'assets/s2.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String name, String image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 120.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExerciseAlert(String name, String gif, String pict) {
    int _counter = 20;
    bool _isPaused = false;
    bool _showstart = true;
    bool _showContinueButton = false;
    bool _showpict = true;
    bool _showgif = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            final counterStream = Stream<int>.periodic(
              Duration(seconds: 1),
              (num) {
                if (_counter == 0) {
                  setState(() {
                    _showpict = true;
                    _showstart = true;
                    _isPaused = false;
                  });
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Exercise done successfully, Kudos!'),
                    ),
                  );
                  _counter = 20;
                } else if (_isPaused) {
                  _counter--;
                }
                return _counter;
              },
            ).takeWhile((_) => true);

            return AlertDialog(
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _showpict
                      ? Image.asset(pict, height: 200.0)
                      // ignore: dead_code
                      : Image.asset(gif),
                  // _showgif
                  //     ? Image.asset(gif, height: 200.0)
                  //     : Image.asset(pict),
                  SizedBox(height: 10.0),
                  StreamBuilder<int>(
                    stream: counterStream,
                    builder: (context, snapshot) {
                      return Text(
                        '${snapshot.data ?? _counter}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.0),
                  _showstart
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPaused = true;
                              _showstart = false;
                              _showpict = false;
                              //pict = gif;
                              _showContinueButton = false;
                            });
                          },
                          child: Text(
                            'Start',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      : SizedBox.shrink(),
                  _isPaused
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPaused = false;
                              pict = pict;
                              _showpict = true;
                              _showContinueButton = true;
                            });
                          },
                          child: Text(
                            'Pause',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 10.0),
                  _showContinueButton
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPaused = true;
                              _showpict = false;
                              _showContinueButton = false;
                            });
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
