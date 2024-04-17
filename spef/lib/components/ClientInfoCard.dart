import 'package:flutter/material.dart';

class ClientListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10), 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nom client',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Address clientttttttttttt',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),          Stack(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 7,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF04CA12)),
                  backgroundColor: Color(0xCC737272),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '50%',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),          ElevatedButton.icon(
            onPressed: () {
              print('Button pressed ...');
            },
            icon: Icon(
              Icons.directions,
              size: 20,
              color: Colors.white,
            ),
            label: Text(
              'Itinéraire',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Color(0xFFFBCA19),
            ),
          ),
        ],
      ),
    );
  }
}
