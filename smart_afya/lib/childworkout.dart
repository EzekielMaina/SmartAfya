import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChildWorkout extends StatefulWidget {
  @override
  _ChildWorkoutState createState() => _ChildWorkoutState();
}

class _ChildWorkoutState extends State<ChildWorkout> {
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Child Workouts',
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
                _showExerciseAlert('Jumping Jacks', 'assets/jumping_jacks.gif',
                    'assets/jumping_jacks.png');
              },
              child: _buildExerciseCard(
                  'Jumping Jacks', 'assets/jumping_jacks.jpg'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Bend Bounces', 'assets/bendbounce.gif',
                    'assets/bendbounce.png');
              },
              child:
                  _buildExerciseCard('Bend Bounces', 'assets/bendbounce.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert(
                    'Running', 'assets/running.gif', 'assets/runningpic.png');
              },
              child: _buildExerciseCard('Running', 'assets/runningpic.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert(
                    'Cycling', 'assets/cycling.gif', 'assets/cycling.png');
              },
              child: _buildExerciseCard('Cycling', 'assets/cycling.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert(
                    'Spring Charge', 'assets/charge.gif', 'assets/charge.png');
              },
              child: _buildExerciseCard('Spring Charge', 'assets/charge.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Bend Stretch Jumps',
                    'assets/bendstretchjumps.gif', 'assets/bendjumping.png');
              },
              child: _buildExerciseCard(
                  'Bend Stretch Jumps', 'assets/bendstretchjumps.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Leg Stretches', 'assets/crabwalk.gif',
                    'assets/legstretch.png');
              },
              child: _buildExerciseCard('Crab Walks', 'assets/legstretch.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Squats', 'assets/squat-animated.gif',
                    'assets/squat-animated.png');
              },
              child: _buildExerciseCard('Squats', 'assets/squat-animated.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert(
                    'Rope Skipping', 'assets/skipping.gif', 'assets/ruka.png');
              },
              child: _buildExerciseCard('Rope Skipping', 'assets/skipping.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Side Twist', 'assets/sidetwists.gif',
                    'assets/sidetwists.png');
              },
              child: _buildExerciseCard('Side Twist', 'assets/sidetwists.png'),
            ),
            InkWell(
              onTap: () {
                _showExerciseAlert('Toe Charges', 'assets/toecharge.gif',
                    'assets/toecharge.png');
              },
              child: _buildExerciseCard('Toe Charges', 'assets/toecharge.png'),
            ),
          ],
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
