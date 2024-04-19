import 'package:flutter/material.dart';

import 'package:spef/pages/client.dart';

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  bool? _checkboxValue1 = false;
  bool? _checkboxValue2 = false;
  bool? _checkboxValue3 = false;
  String? _radioValue = 'Option 1';
  String? _radioValue1 = 'Option 1';
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
                    _radioValue1 = value as String?;
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
                    _radioValue1 = value as String?;
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
                    _radioValue1 = value as String?;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Question 1',
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
                    _checkboxValue1 = value;
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
                    _checkboxValue2 = value;
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
                    _checkboxValue3 = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
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
                groupValue: _radioValue,
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    _radioValue = value as String?;
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
                    _radioValue = value as String?;
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
                    _radioValue = value as String?;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientPage(
                                  initialTabIndex: 1,
                                )),
                      );
                    },
                    child: Text(
                      'Enregistré',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
