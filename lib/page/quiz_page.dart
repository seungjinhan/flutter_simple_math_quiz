import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quiz_app/utils/question.dart';
import 'package:quiz_app/utils/question_list.dart';
import 'package:quiz_app/ui/question_box.dart';
import 'package:quiz_app/ui/overlay.dart';
import 'package:quiz_app/page/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState() {
    init();
  }

  Question _currentQuestion;
  QuestionList _questionList = QuestionList([
    Question("1+1", "2", "3", "4", "5", "1"),
    Question("2+3", "3", "4", "5", "6", "3"),
    Question("3+1", "4", "5", "6", "7", "1"),
    Question("4+2", "5", "6", "7", "8", "2"),
    Question("4+3", "5", "6", "2", "7", "4"),
  ]);

  int _questionNum = 0;
  int _score = 0;
  bool _isCorrect;
  bool _overlayVisible;

  void init() {
    _overlayVisible = false;
    _currentQuestion = _questionList.nextQuestion;
    _questionNum = _questionList.questionNumber;
  }

  void choiceHandler(String s) {
    _isCorrect = (s == _currentQuestion.correctChoice);
    _score = _isCorrect ? _score + 1 : _score;

    this.setState(() {
      _overlayVisible = true;
    });
    if (_questionNum == _questionList.length) {
      Timer(
        Duration(seconds: 3),
        () => this.setState(
              () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ScorePage(_score, _questionList.length)));
              },
            ),
      );

      return;
    }

    Timer(
      Duration(seconds: 3),
      () => this.setState(() {
            init();
          }),
    );
  }

  Column _makeQuestion(Question q) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            QuestionBox(Colors.indigo, "A", q.choiceA, () {
              choiceHandler("1");
            }),
            QuestionBox(Colors.pink, "B", q.choiceB, () {
              choiceHandler("2");
            }),
            QuestionBox(Colors.teal, "C", q.choiceC, () {
              choiceHandler("3");
            }),
            QuestionBox(Colors.green, "D", q.choiceD, () {
              choiceHandler("4");
            }),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  color: Colors.deepOrange,
                  width: double.infinity,
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Text(
                      "Quiz " + _questionNum.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
                  child: Center(
                    child: Text(
                      _currentQuestion.questionTitle,
                      style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              _makeQuestion(_currentQuestion),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              _overlayVisible ? CustomOverLay(_isCorrect) : Container(),
            ],
          )
        ],
      ),
    );
  }
}
