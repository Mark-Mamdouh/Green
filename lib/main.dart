import 'package:flutter/material.dart';
import './Screens/welcome_screen.dart';
import 'package:flutter/services.dart';

@override
void initState() {
  // hide notification bar
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new WelcomeScreen(),
    );
  }
}
