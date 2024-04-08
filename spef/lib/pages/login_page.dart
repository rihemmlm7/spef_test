import 'package:flutter/material.dart';
import 'package:spef/pages/ResetPasswordPage.dart';
import 'package:spef/pages/signup.dart';
import 'package:spef/pages/home.dart';
import 'package:spef/pages/styles/login_page_style.dart'; 
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: LoginPageStyle.containerDecoration(), 
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 190),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 63,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(119.5),
                        image: DecorationImage(
                          image: AssetImage('assets/logos/logospef.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'SPEF',
                      style: LoginPageStyle.titleTextStyle(), 
                    ),
                  ],
                ),
              ),
              Container(
                decoration: LoginPageStyle.textFieldDecoration(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(19, 21.3, 19.5, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Connectez-vous',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF2B2B2B),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Entrez votre adresse e-mail',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Mot de passe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B2B2B),
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Entrez votre mot de passe',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFADADAD),
                            fontFamily: 'Quicksand',
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.4),
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                'Rester connecté ?',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF707070),
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBCA19),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(), // Navigate to home.dart
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 14, 0.6, 14),
                            child: Text(
                              'Connexion',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'vous n\'avez pas encore de compte',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'inscrivez-vous ici',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFBCA19),
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
