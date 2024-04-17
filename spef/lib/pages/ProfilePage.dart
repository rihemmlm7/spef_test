import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double avatarSize = screenWidth * 0.3; // Define the desired size

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(
            screenWidth * 0.1), // Use screenWidth for horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.grey[300], // Gray background color
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Material(
                  color: Colors.grey[300], // Gray background color
                  shape: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Implement edit profile functionality
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60, // Set the desired size here
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0'), // Add your profile picture URL here
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.02), // Adjusted height based on screen height
                  Text(
                    'John Doe', // Add your name here
                    style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight
                            .bold), // Adjusted font size based on screen height
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.03), // Adjusted height based on screen height
                  FractionallySizedBox(
                    widthFactor:
                        1, // Adjust the width factor as needed (0.6 means 60% of the available width)
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: screenHeight * 0.002,
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.03), // Adjusted height based on screen height
                  // Icon with title and address
                  ListTile(
                     
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to zero to control padding manually
                    leading: Icon(Icons.location_on), // Icon
                    title: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              8.0), // Add left padding to create space between icon and title
                      child: Text(
                        'Address', // Title
                        style: TextStyle(
                            fontSize: screenHeight *
                                0.025), // Adjusted font size based on screen height
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              15.0), // Add left padding to create space between icon and address
                      child: Text(
                        '123 Street, City, Country', // Address
                        style: TextStyle(
                            fontSize: screenHeight *
                                0.02), // Adjusted font size based on screen height
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.03), 
                  ListTile(
                    contentPadding: EdgeInsets
                        .zero, // Set contentPadding to zero to control padding manually
                    leading: Icon(Icons.phone), // Icon
                    title: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              8.0), // Add left padding to create space between icon and title
                      child: Text(
                        'Téléphone', // Title
                        style: TextStyle(
                            fontSize: screenHeight *
                                0.025), // Adjusted font size based on screen height
                      ),
                    ),
                    
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              15.0), // Add left padding to create space between icon and address
                      child: Text(
                        '123 Street, City, Country',
    
                        style: TextStyle(
                            fontSize: screenHeight *
                                0.02), // Adjusted font size based on screen height
                      ),
                    ),
                  ),
                    SizedBox(
                      height: screenHeight *
                          0.03), // Adjusted height based on screen height
                  FractionallySizedBox(
                    widthFactor:
                        1, // Adjust the width factor as needed (0.6 means 60% of the available width)
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: screenHeight * 0.002,
                    ),
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
