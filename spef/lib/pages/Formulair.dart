import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:spef/components/Doc.dart';
import 'package:spef/components/Media.dart';
import 'package:spef/components/Questionnaire.dart';
import 'package:spef/pages/client.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final int clientsTab1 = 10;
  final int clientsTab2 = 20;
  final int clientsTab3 = 30;
  late int _currentTabIndex;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = 0; // Initially set to the first tab
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Formulaire'),
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
                          fontSize: 16.0,
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
                          fontSize: 16.0,
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
                          fontSize: 16.0,
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
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: _currentTabIndex == 0
            ? BottomAppBar(
                color: Theme.of(context).bottomAppBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ClientPage(initialTabIndex: 1)),
                        );
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _selectMenuItem('Choisir une photo ou une vidéo');
          },
          backgroundColor: Colors.amber,
          child: Icon(Icons.description, color: Colors.white),
          shape: CircleBorder(),
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
            fontSize: 15.0,
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

  void _selectMenuItem(String value) async {
    final picker = ImagePicker();
    late var pickedFile;

    if (value == 'Choisir une photo ou une vidéo') {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else if (value == 'Prendre une photo ou une vidéo') {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }
    late String filePath;

    if (value == 'Choisir des documents') {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        filePath = result.files.single.path!;
        // Handle the selected file path as needed
      } else {
        // User canceled the picker
      }
    }

    // Handle other actions if needed
  }
}
