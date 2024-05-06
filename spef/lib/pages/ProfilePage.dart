import 'package:flutter/material.dart';
import 'package:spef/components/HistoriqueProfile.dart';
import 'package:spef/pages/FicheClientPros.dart';
import 'package:spef/pages/ClientVisitPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double avatarSize = screenWidth * 0.3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Padding(
  padding: const EdgeInsets.all( 20.0),
  child: Row(
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
                      AddClientPage()), // Navigate to EditProfile screen
            );
          },
        ),
      ),
    ],
  ),
),

            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/seed/9/600'),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: screenHeight * 0.02,
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
                    contentPadding: EdgeInsets.only(left: 25.0,right:25.0),
                    leading: Icon(Icons.location_on),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Address',
                        style: TextStyle(fontSize: screenHeight * 0.023),
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
                  SizedBox(height: screenHeight * 0.01),
                  ListTile(
                     contentPadding: EdgeInsets.only(left: 25.0,right:25.0),
                    leading: Icon(Icons.phone),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Téléphone',
                        style: TextStyle(fontSize: screenHeight * 0.023),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        '123456789',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientVisitPage(),
            ),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.note_add, color: Colors.white),
        shape: CircleBorder(),
      ),
    );
  }
}
