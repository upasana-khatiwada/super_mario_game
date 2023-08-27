import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_mario_game/button.dart';
import 'package:super_mario_game/mario.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = 0;
  static double marioY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = marioY;

   void preJump()
// sets the initial height before jumping
  {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    preJump();
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
        // quadratic equation to beat gravity
        //used in fluppy bird


         // every time you click jump it increases by 0.05
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        // rebuild the widget with new values
        setState(() {
          marioY = 1;
        });
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }
    });
  }

  void moveLeft(){
setState(() {
  marioX -= 0.02;
});
  }

  //Moving right function +=0.02
  // moving right is  positive
  void moveRight(){
setState(() {
  marioX += 0.02;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment(marioX, marioY),
              color: Colors.blue,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                child: const MyMario(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      button: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                    ),
                    MyButton(
                      button: const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      function: jump,
                    ),
                    MyButton(
                      button: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      function: moveRight,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
