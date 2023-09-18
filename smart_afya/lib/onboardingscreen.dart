import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smart_afya/main.dart';
import 'package:smart_afya/exhome.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Builder(
                builder: (BuildContext context) {
                  return FitnessHomePage();
                },
              )),
    );
  }

  void _onIntroSkip(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Builder(
                builder: (BuildContext context) {
                  return FitnessHomePage();
                },
              )),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', height: 500.0, width: 300.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0, color: Colors.white);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Learn as you go",
              body:
                  "Download the SmartAfya app and build the stamina to keep you moving.",
              image: _buildImage('ss'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Aided training",
              body: "Personalized \n Workout Routine",
              image: _buildImage('ssp'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body: "Kids and teens can track their physique that you approve.",
              image: _buildImage('ssp5'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "With you every step",
              body:
                  "Empowering You to Overcome Challenges: Your Ultimate Partner for a Confident Physique",
              image: _buildImage('ssp3'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroSkip(context),
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.grey,
            activeSize: Size(22.0, 10.0),
            activeColor: Colors.black,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
