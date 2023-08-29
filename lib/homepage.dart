import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_mario_game/button.dart';
import 'package:super_mario_game/jumpingmario.dart';
import 'package:super_mario_game/mario.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = 0;
  static double marioY = 1;

  // for jumping functions
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  String direction = "right";
  bool midrun = false; //to flip around the image
  bool midjump = false; //is false at first because it is at floor at first

  void preJump()
// sets the initial height before jumping
  {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    //disables the double jump
   if(midjump == false){
     midjump = true; //because mario is jumping
    preJump();
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // quadratic equation to beat gravity
      //used in fluppy bird

      // every time you click jump it increases by 0.05
      time += 0.05;
      height = -4.9 * time * time + 5 * time;
      if (initialHeight - height > 1) {
        //because mario is landed on ground
        midjump = false;
        // rebuild the widget with new values
        setState(() {
          marioY = 1;
        });
        timer
            .cancel(); //to make jump evenly as it goes fast every second third click
      } else {
        setState(() {
          marioY = initialHeight - height;
        });
      }
    });
   }
  }

  //Moving right  +=0.02
  // moving right is  positive
  void moveRight() {
    direction = "right";
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (const MyButton().userIsHoldingButton() == true &&
          (marioX + 0.02) < 1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (const MyButton().userIsHoldingButton() == true &&
          (marioX - 0.02) > -1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment(marioX, marioY),
                  color: Colors.blue,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    child: midjump
                        ? JumpingMario(
                            direction: direction,
                          )
                        : MyMario(
                            direction: direction,
                            midrun: midrun,
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("MARIO",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("0000",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("WORLD",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("1-1",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("TIME",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("9999",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
