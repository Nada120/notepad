import 'package:flutter/material.dart';

Widget myListTile({
  required String title,
  required String subtitle,
  required Color color,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: ListTile(
      onTap: (){},
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
         
}