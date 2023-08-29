// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  final direction;
  final size;

  const JumpingMario({super.key,this.direction,this.size});

  @override
  Widget build(BuildContext context) {
    if(direction=="right"){
      return Container(
      width: size,
      height: size,
      child: Image.asset("images/jumpingMario.png"),
    );
    }else{
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi), // rotation while jumping facing left
        child: Container(
        width: size,
        height: size,
        child: Image.asset("images/jumpingMario.png"),
          ),
      );
    }
  }
}