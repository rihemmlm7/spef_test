import 'package:flutter/material.dart';

class NotifComp extends StatefulWidget {
  @override
  _NotifCompState createState() => _NotifCompState();
}

class _NotifCompState extends State<NotifComp> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2),
          _buildItem(
            bgColor: Colors.white,
            width: screenWidth * 0.9,
            count: 78,
            prospect: 'Prospect',
            time: 'Il y a 30 min',
            newClient: '🌟 Nouveau client:',
            description: 'Un nouveau prospect, [Nom de client], a été ajouté.',
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required Color bgColor,
    required double width,
    required int count,
    required String prospect,
    required String time,
    required String newClient,
    required String description,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: SizedBox(
        width: width,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.03,
            horizontal: screenWidth * 0.03,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '$prospect:',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.red[700],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    expanded ? Icons.remove : Icons.add,
                    color: Colors.grey[600],
                  ),
                ],
              ),
              Text(
                newClient,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: expanded ? null : screenWidth * 0.04,
                curve: Curves.easeInOut,
                child: Text(
                  expanded ? description : description.substring(0, 50) + '...',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey[500],
                  ),
                  maxLines: expanded ? null : 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
