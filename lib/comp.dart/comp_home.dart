import 'package:flutter/material.dart';
import 'dart:math';

Widget myListTile({
  required String title,
  required String subtitle,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
    child: ListTile(
      onTap: (){},
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
         
}