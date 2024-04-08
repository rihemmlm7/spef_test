import 'package:flutter/material.dart';
import './pages/login_page.dart'; 
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
        primarySwatch: Colors.amber
      ),
      debugShowCheckedModeBanner: false, 
      home: SplashWidget(), 
    );
  }
}
