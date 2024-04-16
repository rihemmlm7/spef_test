import 'package:flutter/material.dart';

class clientprospect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context)
        .size
        .width; // Define screenWidth within the build method

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: screenWidth * 0.05), // Adjust the height dynamically
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildItem(
                  bgColor: Colors.white,
                  width: screenWidth * 0.3, // Adjust the width dynamically
                  progress: 50,
                  profile: '',
                  name: 'Nome client',
                  screenWidth:
                      screenWidth, 
                      // Pass screenWidth to _buildItem method
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
    required double screenWidth, // Add screenWidth parameter
  }) =>
      Expanded(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey)), // Add bottom border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle,
                      size: screenWidth * 0.1), // Adjust icon size dynamically
                  SizedBox(
                      width:
                          screenWidth * 0.01), // Adjust the width dynamically
                  Text(name,
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors
                              .grey[600])), // Adjust font size dynamically
                ],
              ),
              SizedBox(
                  width: screenWidth * 0.2), // Adjust the width dynamically
              SizedBox(
                width: screenWidth * 0.1, // Adjust the width dynamically
                height: screenWidth * 0.1, // Adjust the height dynamically
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
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color:
                                Colors.black), // Adjust font size dynamically
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
                      SizedBox(
                          width: screenWidth *
                              0.01), // Adjust the width dynamically
                      Text('Itinéraire', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, // Adjust horizontal padding dynamically
          vertical: screenWidth * 0.01, // Adjust vertical padding dynamically
        ),
      ),
                  )
                ),
              ),
            ],
          ),
        ),
      );
}
