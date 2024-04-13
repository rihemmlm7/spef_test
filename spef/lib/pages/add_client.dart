import 'package:flutter/material.dart';

class AddClientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text('Place Picker'),
              trailing: Icon(Icons.place),
              onTap: () {
                // Implement place picker functionality
              },
            ),
            ListTile(
              title: Text('Status'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Client'),
                  Radio(
                    value: 'client',
                    groupValue: 'status',
                    onChanged: (value) {
                      // Handle radio button change
                    },
                  ),
                  Text('Prospecté'),
                  Radio(
                    value: 'prospecté',
                    groupValue: 'status',
                    onChanged: (value) {
                      // Handle radio button change
                    },
                  ),
                ],
              ),
            ),
            DropdownButtonFormField<String>(
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
              decoration: InputDecoration(labelText: 'Name Type'),
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
            SizedBox(height: 16.0),
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
