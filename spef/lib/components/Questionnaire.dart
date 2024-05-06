import 'package:flutter/material.dart';
import 'package:spef/pages/client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';


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
                   border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromRGBO(252, 227, 0, 0.2),
                  contentPadding: EdgeInsets.all(10), // Optional: Adjust padding for the text field
    // Add border radius
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0), // Set border radius
    ),
                 
                ),
                maxLines: null,
                onChanged: (text) {
    setState(() {}); // Trigger rebuild to update the height
  },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
     
     
    );
  }



}
