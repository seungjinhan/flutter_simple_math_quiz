import 'package:flutter/material.dart';
import 'dart:math';

class CustomOverLay extends StatefulWidget {
  final bool isCorrect;

  const CustomOverLay(this.isCorrect);
  @override
  _CustomOverLayState createState() => _CustomOverLayState();
}

class _CustomOverLayState extends State<CustomOverLay> with SingleTickerProviderStateMixin {
  Animation _iconAnimation;
  AnimationController _ac;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _iconAnimation = CurvedAnimation(parent: _ac, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _ac.forward();
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.isCorrect ? Colors.green : Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Transform.rotate(
              angle: _ac.value * 2 * pi,
              child: Icon(
                widget.isCorrect ? Icons.done : Icons.clear,
                size: _iconAnimation.value * 50.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
