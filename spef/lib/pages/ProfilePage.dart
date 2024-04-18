import 'package:flutter/material.dart';
import 'package:spef/components/HistoriqueProfile.dart';
import 'EditProfile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double avatarSize = screenWidth * 0.3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.grey[300],
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Material(
                  color: Colors.grey[300],
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProfile()), // Navigate to EditProfile screen
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/seed/9/600'),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: screenHeight * 0.002,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.location_on),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Address',
                        style: TextStyle(fontSize: screenHeight * 0.025),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        '123 Street, City, Country',
                        style: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.phone),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Téléphone',
                        style: TextStyle(fontSize: screenHeight * 0.025),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        '123 Street, City, Country',
                        style: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
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
          ],
        ),
      ),
    );
  }
}
