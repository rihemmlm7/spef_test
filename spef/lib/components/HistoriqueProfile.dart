import 'package:flutter/material.dart';

import 'package:spef/pages/Formulair.dart';

class HistoriqueProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfDocuments = 5;
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: Column(
        children: List.generate(5, (index) {
          String textToShow = index % 2 == 0 ? 'Visite' : 'Prospect';

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Formulaire()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 125,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: 50,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/$index/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'Nom client',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                textToShow,
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                  color: textToShow == 'Visite'
                                      ? Colors.yellow
                                      : Colors.grey, // Conditional text color
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Formulaire(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.white), // White background
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black), // Black text color
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.grey)), // Black border
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.description,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Document',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '+$numberOfDocuments',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10), // Space between buttons
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your action here for the second button
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.white), // White background
                                      foregroundColor: MaterialStateProperty.all(
                                          Colors.black), // Black text color
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.grey)), // Black border
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.description,
                                          color: Colors.blue, // Change color if needed
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          ' Document',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '+$numberOfDocuments',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
