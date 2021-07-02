import 'dart:ui';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  Result(this.score);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text("Your Score is    ", style: TextStyle(fontSize: 20))),
        Center(
          child: Text(
            score.toString(),
            style: TextStyle(backgroundColor: Colors.cyan[500], fontSize: 30),
          ),
        ),
      ],
    );
  }
}
