import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {

  final String title1;
  final String subtitle1;

  final String title2;
  final String subtitle2;
  final String title3;
  final String subtitle3;

  CustomCard2({
   
    required this.title1,
    required this.subtitle1,
   
    required this.title2,
    required this.subtitle2,
   
    required this.title3,
    required this.subtitle3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            
            title: Text(
              title1,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
            ),
            subtitle: Text(
              subtitle1,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            
            title: Text(
              title2,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
            ),
            subtitle: Text(
              subtitle2,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            
            title: Text(
              title3,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023),
            ),
            subtitle: Text(
              subtitle3,
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
        ],
      ),
    );
  }
}
