import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final button;
  final function;
  const MyButton({super.key, required this.button,required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.brown.shade300,
            child: button,
          ),
        ),
      ),
    );
  }
}
