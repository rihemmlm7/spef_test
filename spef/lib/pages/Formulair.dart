import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:spef/components/Doc.dart';
import 'package:spef/components/Media.dart';
import 'package:spef/components/Questionnaire.dart';
import 'package:spef/pages/client.dart';


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
        bottomNavigationBar: BottomAppBar(
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
                    MaterialPageRoute(builder: (context) => ClientPage(initialTabIndex: 1)),
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
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: PopupMenuButton(
            offset: Offset(-50, -190),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Choisir une photo ou une vidéo',
                  child: ListTile(
                    title: Text(
                      'Choisir une photo ou une vidéo',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(Icons.image),
                  ),
                ),
                PopupMenuItem(
                  value: 'Prendre une photo ou une vidéo',
                  child: ListTile(
                    title: Text(
                      'Prendre une photo ou une vidéo',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(Icons.camera_alt),
                  ),
                ),
                PopupMenuItem(
                  value: 'Choisir des documents',
                  child: ListTile(
                    title: Text(
                      'Choisir des documents',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(Icons.attach_file),
                  ),
                ),
                PopupMenuItem(
                  value: 'Numériser des documents',
                  child: ListTile(
                    title: Text(
                      'Numériser des documents',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Icon(Icons.scanner),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              _selectMenuItem(value.toString());
            },
            child: FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.amber,
              child: Icon(Icons.description, color: Colors.white),
              shape: CircleBorder(),
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
