import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'assets/note_img.gif',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.fill,
          ),
          Text(
            'Notes Here',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w600,
              color: Colors.green[800],
            ),
          ),
        ],
      ),
    );
  }
}