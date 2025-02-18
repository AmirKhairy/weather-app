import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  final Widget openScreen;

  const SplashScreen({
    super.key,
    required this.openScreen,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Image.asset(
        'assets/images/logo.png',
      ),
      nextScreen: openScreen,
      centered: true,
      backgroundColor: Colors.black,
      splashIconSize: 200,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}