import 'package:flutter/material.dart';

animatedNavigator({required BuildContext context, required Widget page}){
  
  return Navigator.push(context, PageRouteBuilder(
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.linear),
        ),
        child: child,
      );
    }, 
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (
      BuildContext context, 
      Animation<double> animation, 
      Animation<double> secondaryAnimation,
    ) => page,
  ));

}