import 'package:flutter/material.dart';
import '../main.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _totalQuestion;

  const ScorePage(this._score, this._totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Score",
            style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
          Text(
            _score.toString() + "/" + _totalQuestion.toString(),
            style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            iconSize: 80.0,
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => StartPage())),
          ),
        ],
      ),
    );
  }
}
