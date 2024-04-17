import 'package:flutter/material.dart';
import 'package:spef/components/ClientInfoCard.dart';
import 'package:spef/components/Searchcompo.dart';

class ClientPage extends StatelessWidget {
  final int clientsTab1 = 10;
  final int clientsTab2 = 20;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Gestion des Clients'),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.red),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Prospect',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildCircle(clientsTab1),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Clients',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    _buildCircle(clientsTab2),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                      child: CustomSearchWidget(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    Expanded( // Move the Expanded widget here
                      child: Container(
                        padding: EdgeInsets.all(2.0), 
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(20), 
                        ),
                        child: ListView.builder(
                          itemCount: 29, 
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical:0),
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    child: ClientListItem(), 
                                  ),
                                ),
                                Divider(color: Colors.black), // Add a black divider between items
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Center(child: Text('Tab 2 Content')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(int number) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ClientListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/9/600',
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
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Address clientttttttttttt',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10), // Add space between text and progress
          Stack(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 7,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF04CA12)),
                  backgroundColor: Color(0xCC737272),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '50%',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10), // Add space between progress and button
          ElevatedButton.icon(
            onPressed: () {
              print('Button pressed ...');
            },
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
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          'Profile Page Content',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}