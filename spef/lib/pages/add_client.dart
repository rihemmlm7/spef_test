import 'package:flutter/material.dart';

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String _status = 'client';

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
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
              onTap: () {
                // Implement place picker functionality
              },
            ),
            SizedBox(height: screenSize.height * 0.02), // Adjusted height based on screen height
            Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenSize.height * 0.01), // Adjusted height based on screen height
            Row(
              children: [
                Radio(
                  value: 'client',
                  groupValue: _status,
                  onChanged: (value) {
                    setState(() {
                      _status = value.toString();
                    });
                  },
                ),
                Text('Client'),
                SizedBox(width: screenSize.width * 0.4), // Adjusted width based on screen width
                Radio(
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
                // Handle dropdown selection
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Prenom'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom de l\'Entreprise'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Téléphone'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'RC'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'AI'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'NIF'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'NIC'),
            ),
            SizedBox(height: screenSize.height * 0.02), // Adjusted height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel button press
                  },
                  child: Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle validate button press
                  },
                  child: Text('Valider'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
