import 'package:flutter/material.dart';
import 'package:spef/pages/FicheClientPros.dart';
import 'package:spef/pages/ProfilePage.dart';


class ClienttList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDEE8EB),
          borderRadius: BorderRadius.circular(20), // Apply border radius
        ),
        padding: EdgeInsets.all(10), // Add padding to the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nom client',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 16,
                      color: Colors.black, // Text color changed to white
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Address clientttttttttttt',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 14,
                      color: Colors.black, // Text color changed to white
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10), // Add space between text and progress
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('Edit'),
                    value: 'edit',
                  ),
                  PopupMenuItem(
                    child: Text('Delete'),
                    value: 'delete',
                  ),
                ];
              },
              onSelected: (dynamic value) {
                if (value == 'edit') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddClientPage(),
                    ),
                  );
                } else if (value == 'delete') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text('Are you sure you want to delete this client?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform delete action here
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.directions,
                  size: 20,
                  color: Colors.white,
                ),
                label: Text(
                  'Itinéraire',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color(0xFFFBCA19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}