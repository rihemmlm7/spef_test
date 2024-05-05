import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class FileHandlingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _selectMenuItem(context, value.toString());
          },
          child: FloatingActionButton(
            onPressed: () {}, // Should trigger the PopupMenuButton
            backgroundColor: Colors.amber,
            child: Icon(Icons.description, color: Colors.white),
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }

  void _selectMenuItem(BuildContext context, String value) async {
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
        // Handle the selected file path as needed, for example, you can display it or upload it
      } else {
        // User canceled the picker
      }
    }
    // Handle other menu items if needed
  }
}
