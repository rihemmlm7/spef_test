import 'package:flutter/material.dart';

class NotifComp extends StatefulWidget {
  @override
  _NotifCompState createState() => _NotifCompState();
}

class _NotifCompState extends State<NotifComp> {
  bool expanded = false;

  Widget _buildItem({
    required Color bgColor,
    required double width,
    required int count,
    required String prospect,
    required String time,
    required String newClient,
    required String description,
  }) {
    bool isTruncated = false;
    String truncatedDescription = description;

    if (!expanded) {
      final TextPainter textPainter = TextPainter(
        maxLines: 1,
        text: TextSpan(
          text: description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: width - 30);
      if (textPainter.didExceedMaxLines) {
        isTruncated = true;
        truncatedDescription = description.substring(
                0,
                textPainter
                    .getPositionForOffset(Offset(width - 50, 0))
                    .offset) +
            '...'; 
      }
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
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
                        fontSize: 12,
                        color: Colors.red[700],
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Icon(
                  expanded ? Icons.remove : Icons.add,
                  color: Colors.black,
                ),
              ],
            ),
            Text(
              newClient,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 4),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: expanded ? null : 20,
              curve: Curves.easeInOut,
              child: Text(
                expanded ? description : truncatedDescription,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
                maxLines: expanded ? null : 1,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    'Notification',
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
                      bgColor: Colors.white,
                      width: 370,
                      count: 78,
                      prospect: 'Prospect',
                      time: 'Il y a 30 min',
                      newClient: '🌟 Nouveau client:',
                      description:
                          'Un nouveau prospect, [Nom de client], a été ajoutrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
