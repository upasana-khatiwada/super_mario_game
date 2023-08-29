// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  final direction;
  final midrun;
  const MyMario({super.key, this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    // to change  mario's direction whenever he turns left or right
    if (direction == 'right') {
      return Container(
          height: 50,
          width: 50,
          child: midrun //// transition while standing and running
              ? Image.asset('images/standingMario.png')
              : Image.asset("images/runningmario.png"));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
            height: 50,
            width: 50,
            child: midrun
                ? Image.asset('images/standingMario.png')
                : Image.asset("images/runningmario.png")),
      );
    }
  }
}
