import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.process});
  
  final IconData icon;
  final void Function()? process;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white.withOpacity(0.09),
      ),
      child: IconButton(
        onPressed: process,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
    
}