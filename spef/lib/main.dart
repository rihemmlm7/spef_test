import 'package:flutter/material.dart';
import './pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        scaffoldBackgroundColor: const Color(0xFFE8E8E8),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashWidget(),
    );
  }
}
