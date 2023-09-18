import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeartDiseaseScreen extends StatefulWidget {
  @override
  _HeartDiseaseScreenState createState() => _HeartDiseaseScreenState();
}

class _HeartDiseaseScreenState extends State<HeartDiseaseScreen> {
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
                  'CV Workouts',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert('Leg Stretches', 'assets/crabwalk.gif',
                      'assets/legstretch.png');
                },
                child:
                    _buildExerciseCard('Crab Walks', 'assets/legstretch.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert('Jump Back Bounce', 'assets/card2.gif',
                      'assets/card2.png');
                },
                child:
                    _buildExerciseCard('Jump Back Bounce', 'assets/card2.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert('Up Down stretch', 'assets/card3.gif',
                      'assets/card3.png');
                },
                child:
                    _buildExerciseCard('Up Down stretch', 'assets/card3.png'),
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
                  _showExerciseAlert('Side down pumps', 'assets/ccardio.gif',
                      'assets/ccardio.png');
                },
                child:
                    _buildExerciseCard('Side down pumps', 'assets/ccardio.png'),
              ),
              InkWell(
                onTap: () {
                  _showExerciseAlert(
                      'Up Hand walks', 'assets/card5.gif', 'assets/card5.png');
                },
                child: _buildExerciseCard('Up Hand walks', 'assets/card5.png'),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Discover more exercises and healthy routines in our Disease Workout section!',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[999],
                  ),
                  textAlign: TextAlign.center,
                ),
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
