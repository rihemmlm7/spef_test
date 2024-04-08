import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'client.dart';
import 'history.dart';
import 'message.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
        elevation: 0,
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()),
                      );
                    },
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                  ), 
                  Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClientPage()),
                    );
                  },
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ), // Icon
                Text(
                  "Client",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage()),
                    );
                  },
                  icon: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ), 
                Text(
                  "History",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage()),
                    );
                  },
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ), 
                Text(
                  "Message",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
