import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final button;
  final function;
  static bool holdingButton = false;
  const MyButton({super.key,  this.button, this.function});

  bool userIsHoldingButton(){
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       // tapping down
      onTapDown: (details) {
        holdingButton = true;
        function();
      },
      //release the finger from button
      onTapUp: (details) {
        holdingButton = false;
      },
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.brown.shade300,
          child: button,
        ),
      ),
    );
  }
}
