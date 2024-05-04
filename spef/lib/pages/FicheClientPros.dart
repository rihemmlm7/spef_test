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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildListTile(
              title: 'Position',
              onTap: () {},
              icon: Icons.place,
              color: Colors.blue,
            ),
            SizedBox(height: screenSize.height * 0.02),
            buildSectionTitle(title: 'Status'),
            buildRadioGroup(
              value1: 'client',
              value2: 'prospect',
              text1: 'Client',
              text2: 'Prospect',
            ),
            SizedBox(height: screenSize.height * 0.02),
            buildSectionTitle(title: 'Type'),
            buildDropdownButtonFormField(),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'Nom'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'Prénom'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'Nom de l\'Entreprise'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'Téléphone'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'Email'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'RC'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'AI'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'NIF'),
            SizedBox(height: screenSize.height * 0.02),
            buildTextInputField(label: 'NIC'),
          ],
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
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
    required Color color,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      tileColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      trailing: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }

  Widget buildSectionTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget buildRadioGroup({
    required String value1,
    required String value2,
    required String text1,
    required String text2,
  }) {
    return Row(
      children: [
        Radio(
          activeColor: Colors.blue,
          value: value1,
          groupValue: _status,
          onChanged: (value) {
            setState(() {
              _status = value.toString();
            });
          },
        ),
        Text(text1),
        SizedBox(width: MediaQuery.of(context).size.width / 2.66),
        Radio(
          activeColor: Colors.blue,
          value: value2,
          groupValue: _status,
          onChanged: (value) {
            setState(() {
              _status = value.toString();
            });
          },
        ),
        Text(text2),
      ],
    );
  }

  Widget buildDropdownButtonFormField() {
    return DropdownButtonFormField<String>(
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
          child: Text('Éleveur'),
        ),
        DropdownMenuItem<String>(
          value: 'type2',
          child: Text('Revendeur'),
        ),
        DropdownMenuItem<String>(
          value: 'type3',
          child: Text('Coopérative'),
        ),
        DropdownMenuItem<String>(
          value: 'type4',
          child: Text('Revendeur et Éleveur'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _selectedType = value!;
        });
      },
    );
  }

  Widget buildTextInputField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
