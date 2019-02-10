import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  final Color _btnColor;
  final String _btnText;
  final String _choiceText;
  final VoidCallback _onPressed;

  const QuestionBox(this._btnColor, this._btnText, this._choiceText, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(width: 1.0, color: Colors.black87),
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            //   child: Center(
            //     child: Text(
            //       _choiceText,
            //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: RaisedButton(
                color: _btnColor,
                child: Text(
                  _choiceText,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),
                ),
                onPressed: () => _onPressed(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
