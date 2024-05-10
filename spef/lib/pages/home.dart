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
  bool showAdditionalButtons = false;
  _HomeState({required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
                   PageStorage(
            child: _getScreen(currentTab),
            bucket: PageStorageBucket(),
          ),
                   if (showAdditionalButtons)
            GestureDetector(
              onTap: () {
                setState(() {
                  showAdditionalButtons = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
                   if (showAdditionalButtons)
            Positioned(
              bottom: 30.0,              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 120,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientVisitPage(),
                            ),
                          );
                        },
                        backgroundColor: Colors.amber,
                        child: Text(
                          'Visit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      height: 60,
                      width: 120,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddClientPage(),
                            ),
                          );
                        },
                        backgroundColor: Colors.amber,
                        child: Text(
                          'Prospect',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add, color: Colors.white),
        backgroundColor: Colors.red,
        onPressed: () {
                   setState(() {
            showAdditionalButtons = !showAdditionalButtons;
          });
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
