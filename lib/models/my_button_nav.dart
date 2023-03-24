import 'package:flutter/material.dart';

Widget myButtonNavigator({
  required void Function()? process,
  required IconData iconName,
  required String text
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        onPressed: process, 
        icon: Icon(
          iconName,
          color: Colors.grey.shade800,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade800,
        ),
      ),
    ],
  );
}
