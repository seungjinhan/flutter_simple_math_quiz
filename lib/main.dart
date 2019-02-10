import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'page/quiz_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    //Timer(Duration(seconds: 5), () => Navigator.of(context).push(MaterialPageRoute(builder: (contest) => QuizPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                    ),
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/logo.jpg'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    Container(
                      width: 500.0,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.pink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Starting.....",
                      style: TextStyle(color: Colors.yellow, fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
