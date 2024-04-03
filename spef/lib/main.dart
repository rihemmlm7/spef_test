import 'package:flutter/material.dart';
import 'package:spef/pages/splashScreen.dart';
import './pages/login_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false, 
          home: Splash_Animated());
    
  }
}
