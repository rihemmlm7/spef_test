import 'package:flutter/material.dart';
import 'package:spef/components/DasheComponent.dart';
import 'package:spef/components/NotifComp.dart';
import 'package:spef/pages/history.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: ClipOval(
          child: Container(
            width: 40,
            height: 40,
            child: Image.network(
              'https://icon-library.com/images/no-user-image-icon/no-user-image-icon-0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the entire body
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Rapport du jour',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MyComponent(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(
                          color: Color(0xFFE8E8E8), // Set background color here
                          child: HistoryPage(),
                        ),
                      ),
                    );
                  },
                  child: NotifComp(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
