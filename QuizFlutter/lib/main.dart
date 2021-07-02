import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "question": "Which Us city do the Avengers battle the Chitauri",
      "options": ["Los Angeles", "Miami", "NewYork", "newjersy"],
      "ans": "NewYork"
    },
    {
      "question": "Who is Loki's adopted brother?",
      "options": ["Odin", "Thor", "Tony"],
      "ans": "Thor"
    },
    {
      "question": "Who sells Ultron Vibranium and instantly makes billions",
      "options": ["Tony Stark", "Nick Fury", "Ulysses Klaue"],
      "ans": "Ulysses Klaue"
    }
  ];
  var questionIndex = 0;
  var result = 0;

  answerQuestion(int qi, String ans) {
    setState(() {
      if (ans == questions[qi]['ans']) result = result + 1;
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.cyan[300],
        ),
        body: Column(
          children: [
            questionIndex < questions.length
                ? Quiz(questions, answerQuestion, questionIndex)
                : Result(result),
          ],
        ),
        // debugShowCheckedModeBanner: false,
      ),
    );
  }
}
