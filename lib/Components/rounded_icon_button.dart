import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screens/info_page.dart';

class RoundIconButton extends StatelessWidget {
  String text;
  Color color;

  RoundIconButton(String text, Color color) {
    this.text = text;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        FontAwesomeIcons.infoCircle,
        color: Colors.white,
        size: 25,
      ),
      onPressed: () {
        // go to info page and send details to it
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InfoPage(text, color);
        }));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color.fromRGBO(22, 24, 44, 1),
      // set size of the box
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}
