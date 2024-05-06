import 'package:flutter/material.dart';
import 'package:spef/pages/ClientVisitPage.dart';
import 'package:spef/pages/FicheClientPros.dart';

import 'client.dart';
import 'dashboard.dart';
import 'history.dart';
import 'message.dart';

class Home extends StatefulWidget {
  final int currentTab;

  Home({Key? key, this.currentTab = 0}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(currentTab: currentTab);
}

class _HomeState extends State<Home> {
  int currentTab;

  _HomeState({required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _getScreen(currentTab),
        bucket: PageStorageBucket(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add, color: Colors.white),
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ClientVisitPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(100, 40),
                              ),
                              child: Text(
                                'Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddClientPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: Size(100, 40),
                              ),
                              child: Text(
                                'Prospect',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 0 ? Colors.white : Colors.black,
                      ),
                      Flexible(
                        child: Text(
                          'Dashboard',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: currentTab == 1 ? Colors.white : Colors.black,
                      ),
                      Flexible(
                        child: Text(
                          'Client',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: currentTab == 2 ? Colors.white : Colors.black,
                      ),
                      Flexible(
                        child: Text(
                          'Historique',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: currentTab == 3 ? Colors.white : Colors.black,
                      ),
                      Flexible(
                        child: Text(
                          'Message',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _getScreen(int tab) {
    switch (tab) {
      case 0:
        return DashboardPage();
      case 1:
        return ClientPage(initialTabIndex: 0);
      case 2:
        return HistoryPage();
      case 3:
        return MessagePage();
      default:
        return DashboardPage();
    }
  }
}
