import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final Key key;

  const Search_Bar({
    required this.key, // Mark key as required
    this.hintText = 'Search...',
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.grey), // Add border color if needed
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none, // Remove the default input border
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0), // Adjust padding as needed
          ),
        ),
      ),
    );
  }
}