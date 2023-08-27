import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  const MyMario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('images/standingMario.png'),
    );
  }
}