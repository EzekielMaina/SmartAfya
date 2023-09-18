import 'package:flutter/material.dart';

class AllWorkOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Workouts'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildItem('Abs Workout', 'assets/abs_workout.png'),
          _buildItem('Arm Workout', 'assets/arm_workout.jpg'),
          _buildItem('Leg Workout', 'assets/leg_workout.png'),
          _buildItem('Shoulder Workout', 'assets/butt_workout.png'),
          _buildItem('Chest Workout', 'assets/chest_workout.png'),
          _buildItem('Back Workout', 'assets/back_workout.png'),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
