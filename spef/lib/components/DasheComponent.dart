import 'package:flutter/material.dart';

int count = 0;

class MyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Rapport du jour',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItem(
                Colors.white,
                120,
                count,
                Icons.people,
                Colors.blue,
                'Total des visite',
              ),
              SizedBox(width: 15),
              _buildItem(
                Colors.white,
                120,
                count,
                Icons.remove_red_eye,
                Colors.green,
                'Derniers visite',
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItem(
                Colors.white,
                120,
                count,
                Icons.car_repair,
                Colors.orange,
                'Tournées du jour',
              ),
              SizedBox(width: 15),
              _buildItem(
                Colors.white,
                120,
                count,
                Icons.person,
                Colors.red,
                'Client procpecté',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(Color bgColor, double width, int count, IconData icon,
      Color iconColor, String itemName) {
    return Expanded(
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 9),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: iconColor),
                SizedBox(width: 80),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              itemName,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
