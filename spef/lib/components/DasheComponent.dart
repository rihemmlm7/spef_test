import 'package:flutter/material.dart';

int count = 0;

class MyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDashboardCard(
                context,
                Colors.white,
                120,
                count,
                Icons.people,
                Colors.blue,
                'Total des visite',
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 23),
              _buildDashboardCard(
                context,
                Colors.white,
                120,
                count,
                Icons.remove_red_eye,
                Colors.green,
                'Derniers visite',
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDashboardCard(
                context,
                Colors.white,
                120,
                count,
                Icons.car_repair,
                Colors.orange,
                'Tournées du jour',
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 23),
              _buildDashboardCard(
                context,
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

  Widget _buildDashboardCard(
    BuildContext context,
    Color bgColor,
    double width,
    int count,
    IconData icon,
    Color iconColor,
    String itemName,
  ) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 9),
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
      ),
    );
  }
}
