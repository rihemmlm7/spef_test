import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final double progress;
  final Key key;

  const ProfileCard({
    required this.key,
    required this.name,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 50.0, color: Colors.blue),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text('Progress: ${(progress * 100).toStringAsFixed(1)}%'),
              SizedBox(height: 5.0),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Action when 'Itinéraire' button is pressed
            },
            child: Column(
              children: [
                Icon(Icons.directions, color: Colors.blue),
                Text('Itinéraire'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
