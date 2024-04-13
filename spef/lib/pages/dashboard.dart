import 'package:flutter/material.dart';
import 'package:spef/components/DasheComponent.dart';
import 'package:spef/components/NotifComp.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: ClipOval(
          child: Container(
            width: 40,
            height: 40,
            child: Image.network(
                'https://icon-library.com/images/no-user-image-icon/no-user-image-icon-0.jpg',
                fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MyComponent(),
          ),
          SizedBox(height: 0),
          Expanded(
            child: NotifComp(),
          ),
        ],
      ),
    );
  }
}
