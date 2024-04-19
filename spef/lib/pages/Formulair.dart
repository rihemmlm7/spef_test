import 'package:flutter/material.dart';
import 'package:spef/components/Doc.dart';
import 'package:spef/components/Media.dart';
import 'package:spef/components/Questionnaire.dart';

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
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Questionnaire(),
                ),
                _buildTab2Content(context),
                _buildTab3Content(context),
              ], // Moved the closing bracket to the correct position
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

  Widget _buildTab2Content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          DateTime date = DateTime.now().add(Duration(days: index));
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                DocumentItem(
                  documentName: 'Document ${index + 1}',
                  date: date,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                  height: 3,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildTab3Content(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      scrollDirection: Axis.vertical,
      itemCount: 6, // Example: 6 media items
      itemBuilder: (context, index) {
        return _buildMediaItem('https://picsum.photos/seed/${index * 100}/600');
      },
    );
  }

  Widget _buildMediaItem(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 300,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
