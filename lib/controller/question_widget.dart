import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
    @required this.questions,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final List<Map<String, Object>> questions;
  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      questions[_counter]['question'],
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
