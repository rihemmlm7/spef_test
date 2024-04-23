import 'package:flutter/material.dart';
import 'package:spef/components/HistoriqueProfile.dart';
import 'package:spef/components/calendar.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double avatarSize = screenWidth * 0.3;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Historique'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Calendar(),
            ),
            SizedBox(height: screenHeight * 0.01),
            FractionallySizedBox(
              widthFactor: 1,
              child: Divider(
                color: Colors.grey[300],
                thickness: screenHeight * 0.002,
              ),
            ),
            Expanded(
              child: HistoriqueProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
