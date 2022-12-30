import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'tab_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const TabScreen(),
      splash: 'assets/splash.png',
      backgroundColor: Colors.blueAccent,
      splashIconSize: 200,
    );
  }
}
