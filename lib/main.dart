import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:note_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notepad',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/note.jpeg',
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
      ),
    );
  }
}

