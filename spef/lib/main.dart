import 'package:flutter/material.dart';
import 'package:spef/pages/dashboard.dart';
import 'package:spef/pages/home.dart';
import './pages/login_page.dart'; 
import './pages/splashScreen.dart'; 
import './components/DasheComponent.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFE8E8E8),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          // Add more text styles as needed
        ),
        // Add more theme properties as needed
      ),
      debugShowCheckedModeBanner: false, 
      home: SplashWidget(), 
    );
  }
}
