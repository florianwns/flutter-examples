// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './text_control.dart';
import './text_output.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _text = "Hello ...";
  
  void _updateText() {
    setState(() {
      _text = "... World !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Change the text"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextOutput(_text),
              TextControl(_updateText),
            ],
          ),
        ),
      ),
    );
  }
}
