import 'package:flutter/material.dart';

class clientprospect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildItem(
                  bgColor: Colors.white,
                  width: 120,
                  progress: 50,
                  profile: '',
                  name: 'Nome client',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required Color bgColor,
    required double width,
    required double progress,
    required String profile,
    required String name,
  }) =>
      Expanded(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle, size: 43),
                  SizedBox(width: 2),
                  Text(name,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ],
              ),
              SizedBox(width: 50),
              SizedBox(
                width: 40,
                height: 38,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: progress / 100,
                      strokeWidth: 5,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    Center(
                      child: Text(
                        '${progress.toInt()}%',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.directions, color: Colors.black),
                      SizedBox(width: 4),
                      Text('Itinéraire', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
