import 'package:flutter/material.dart';

class Mushrooms extends StatelessWidget {
  const Mushrooms({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Image.asset("images/mushroom.png"),
    );
  }
}