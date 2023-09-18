import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to Smart Afya app!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Smart Afya is a cross platform mobile application. The app is designed to make your wellness journey more enjoyable and effective. With our app, you can easily set reminders for your medical appointments and medication schedules, making sure you never miss a dose or appointment.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Our app also allows you to browse health articles and stay up-to-date with the latest medical news and research, so you can make informed decisions about your health.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'For those looking to stay active and fit, our app includes a fitness module with exercise recommendations and tracking features, helping you stay on top of your fitness goals.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'In addition, our app has a fun puzzle game to keep your mind sharp and entertained, while the balanced diet module provides healthy meal suggestions and nutritional information to help you achieve a balanced and healthy diet.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'To further enhance your experience, our app features a mood music player that provides relaxing and calming music to help you unwind and destress.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Finally, our app generates detailed reports on your progress, so you can track your journey and make informed decisions about your health and wellness.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
