import 'package:flutter/material.dart';
import 'package:quiz/Question_Bank.dart';
import 'package:quiz/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scorekeeper = [];

  QuestionBank questionBank = QuestionBank();

  int questionNumber = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank.questions[questionNumber].answer;
    if (correctAnswer == userPickedAnswer) {
      scorekeeper.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scorekeeper.add(const Icon(Icons.close, color: Colors.red));
    }
    setState(() {
      if (questionNumber < questionBank.questions.length - 1) {
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    questionBank.questions[questionNumber].question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25.0, color: Colors.black),
                  )))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text(
                  'True',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                  setState(() {
                    if (questionNumber < questionBank.questions.length - 1) {
                      questionNumber++;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scorekeeper,
          ),
        ],
      ),
    );
  }
}
