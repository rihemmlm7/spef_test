import 'package:flutter/material.dart';

class Formulaire extends StatelessWidget {
  final int clientsTab1 = 10;
  final int clientsTab2 = 20;
  final int clientsTab3 = 30;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Formulair'),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.red),
              insets: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Questionnaire',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    _buildCircle(context, clientsTab1),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Doc',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    _buildCircle(context, clientsTab2),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Medias',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    _buildCircle(context, clientsTab3),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(BuildContext context, int number) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.06,
      height: MediaQuery.of(context).size.width * 0.06,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
