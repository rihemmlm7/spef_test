import 'package:flutter/material.dart';
import 'package:spef/components/ClienttList.dart';
import 'package:spef/components/ProspectComponent.dart';
import 'package:spef/components/Searchcompo.dart';
import 'package:spef/pages/ProfilePage.dart';

class ClientPage extends StatelessWidget {
  final int initialTabIndex;

  ClientPage({required this.initialTabIndex});
  final int clientsTab1 = 10;
  final int clientsTab2 = 20;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialTabIndex,
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
                _buildProspectTab(context),
                _buildClientTab(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProspectTab(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: CustomSearchWidget(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Container(
                          padding: EdgeInsets.all(0),
                          child: ProspectComponent(),
                        ),
                      ),
                      
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClientTab(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: CustomSearchWidget(
            controller: TextEditingController(),
            focusNode: FocusNode(),
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              itemCount: 29,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(index.toString()), // Unique key for each item
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (DismissDirection direction) async {
                    // Show a confirmation dialog
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "Êtes-vous sûr de vouloir supprimer ce client ?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(false),
                              child: Text("Anuller"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text("Supprimer"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (DismissDirection direction) {
                    // Delete the client from your data source
                    // Remove the item from your list
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: ClienttList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
