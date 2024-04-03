import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:spef/pages/login_page.dart';

class Splash_Animated extends StatelessWidget {
  const Splash_Animated({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 200,
      splash: Stack(
        children: [
          
          AnimatedAlign(
            alignment: Alignment.center,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 0.0),
              duration: Duration(seconds:0 ),
              builder: (context, value, child) {
                return Transform.translate(
                  offset:
                      Offset(0.0, value * 0), 
                );
              },
            ),
          ),
          
          Align(
            alignment: Alignment.center,
            child: const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/logos/logospef.png"),
            ),
          ),
          
          AnimatedAlign(
            alignment: Alignment.center,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return Transform.translate(
                  offset:
                      Offset(0.0, value * 100), 
                  child: Opacity(
                    opacity: value,
                    child: Text(
                      'SPEF',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      nextScreen: LoginPage(),
    );
  }
}
