import 'package:flutter/material.dart';
import 'package:spef/pages/Formulair.dart';

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String _selectedType = 'type1';
  String _status = 'client';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fiche de Client Prospecté'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                'Position',
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              trailing: Icon(
                Icons.place,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: 'client',
                  groupValue: _status,
                  onChanged: (value) {
                    setState(() {
                      _status = value.toString();
                    });
                  },
                ),
                Text('Client'),
                SizedBox(width: screenSize.width / 2.66),
                Radio(
                  activeColor: Colors.blue,
                  value: 'prospect',
                  groupValue: _status,
                  onChanged: (value) {
                    setState(() {
                      _status = value.toString();
                    });
                  },
                ),
                Text('Prospect'),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenSize.height * 0.01),
            DropdownButtonFormField<String>(
              value: _selectedType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              items: [
                DropdownMenuItem<String>(
                  value: 'type1',
                  child: Text('Type 1'),
                ),
                DropdownMenuItem<String>(
                  value: 'type2',
                  child: Text('Type 2'),
                ),
                DropdownMenuItem<String>(
                  value: 'type3',
                  child: Text('Type 3'),
                ),
                DropdownMenuItem<String>(
                  value: 'type4',
                  child: Text('Type 4'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Nom',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nom de entrprise',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Prenom',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom de l\'Entreprise',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'RC',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'AI',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'NIF',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'NIC',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      MaterialPageRoute(builder: (context) => Formulaire()),
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
          ],
        ),
      ),
    );
  }
}
