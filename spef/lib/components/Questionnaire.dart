import 'package:flutter/material.dart';
import 'package:spef/pages/client.dart';

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  String _radioValue = 'Option 1';
  String _radioValue1 = 'Option 1';
  TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Question 1',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              RadioListTile(
                title: Text('Option 1'),
                value: 'Option 1',
                groupValue: _radioValue1,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue1 = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Option 2'),
                value: 'Option 2',
                groupValue: _radioValue1,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue1 = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Option 3'),
                value: 'Option 3',
                groupValue: _radioValue1,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue1 = value.toString();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Question 2',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text('Option 1'),
                value: _checkboxValue1,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue1 = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text('Option 2'),
                value: _checkboxValue2,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue2 = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text('Option 3'),
                value: _checkboxValue3,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue3 = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Question 3',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              RadioListTile(
                title: Text('Option 1'),
                value: 'Option 1',
                groupValue: _radioValue,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Option 2'),
                value: 'Option 2',
                groupValue: _radioValue,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('Option 3'),
                value: 'Option 3',
                groupValue: _radioValue,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Note',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  hintText: 'Add a note...',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromRGBO(252, 227, 0, 0.2),
                ),
                maxLines: 15,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFE8E8E8),
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
          offset: Offset(-30, 40),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'Choisir une photo ou une vidéo',
                child: ListTile(
                  title: Text(
                    'Choisir une photo ou une vidéo',
                    style: TextStyle(color: Colors.black), // Set text color to black
                  ),
                  leading: Icon(Icons.image),
                ),
              ),
              PopupMenuItem(
                value: 'Prendre une photo ou une vidéo',
                child: ListTile(
                  title: Text(
                    'Prendre une photo ou une vidéo',
                    style: TextStyle(color: Colors.black), // Set text color to black
                  ),
                  leading: Icon(Icons.camera_alt),
                ),
              ),
              PopupMenuItem(
                value: 'Choisir des documents',
                child: ListTile(
                  title: Text(
                    'Choisir des documents',
                    style: TextStyle(color: Colors.black), // Set text color to black
                  ),
                  leading: Icon(Icons.attach_file),
                ),
              ),
              PopupMenuItem(
                value: 'Numériser des documents',
                child: ListTile(
                  title: Text(
                    'Numériser des documents',
                    style: TextStyle(color: Colors.black), // Set text color to black
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
            backgroundColor: Colors.amber, // Set background color to amber
            child: Icon(Icons.description, color: Colors.white), // Set icon color to white
            shape: CircleBorder(), // Make it circular
          ),
        ),
      ),
    );
  }

  void _selectMenuItem(String value) {
    // Handle menu item selection
  }
}
