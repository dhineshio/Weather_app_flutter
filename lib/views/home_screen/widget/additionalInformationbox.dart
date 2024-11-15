import 'package:flutter/material.dart';

class Additionalinformationbox extends StatelessWidget {
  final dynamic icon;
  final String title;
  final String data;
  const Additionalinformationbox(
      {super.key, required this.icon, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Text(title),
          Text(data),
        ],
      ),
    );
  }
}
