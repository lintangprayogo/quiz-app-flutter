import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final Color? colorTop;
  final Color? colorBotom;

  const GradientContainer(
      {super.key, required this.child, this.colorTop, this.colorBotom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          colorTop ?? Colors.deepPurple.shade200,
          colorBotom ?? Colors.deepPurple
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: child,
      ),
    );
  }
}
