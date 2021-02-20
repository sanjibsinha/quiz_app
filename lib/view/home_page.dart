import 'package:flutter/material.dart';
import 'package:quiz_app/controller/answer_widget.dart';
import 'package:quiz_app/controller/question_widget.dart';
import 'package:quiz_app/model/questions_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _correctAnswer = 'Choose your correct answer!';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (_counter == 0) {
      _correctAnswer = 'Choose your correct answer!';
    } else if (_counter == 1) {
      _correctAnswer = 'Synonym of Mendacity was: Falsehood';
    } else if (_counter == 2) {
      _correctAnswer = 'Synonym of Culpable was: Guilty';
    } else {
      _counter = 0;
      _correctAnswer = 'Synonym of Rapacious was: Greedy';
    }
  }

  @override
  Widget build(BuildContext context) {
    var questions = questionList;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QuestionWidget(questions: questions, counter: _counter),
            ...(questions[_counter]['answers'] as List<String>)
                .map(
                  (answer) => buildElevatedButton(answer),
                )
                .toList(),
            Text(
              _correctAnswer,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ElevatedButton buildElevatedButton(String answer) {
    return ElevatedButton(
      onPressed: _incrementCounter,
      child: Text(
        answer,
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}
