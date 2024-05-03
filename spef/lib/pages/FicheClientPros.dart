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
        padding: EdgeInsets.all(30.0),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  child: Text('éleveur'),
                ),
                DropdownMenuItem<String>(
                  value: 'type2',
                  child: Text('Revendeur'),
                ),
                DropdownMenuItem<String>(
                  value: 'type3',
                  child: Text('coopérative'),
                ),
                DropdownMenuItem<String>(
                  value: 'type4',
                  child: Text('Revendeur et éleveur'),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 57,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nom ',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Prénom',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 57,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Prénom',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Nom de l\'Entreprise',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nom de l\'Entreprise',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Téléphone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Téléphone',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'RC',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'RC',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'AI',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'AI',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'NIF',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'NIF',
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
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'NIC',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Container(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'NIC',
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
           
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
}

