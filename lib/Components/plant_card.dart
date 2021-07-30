import 'package:flutter/material.dart';
import 'rounded_icon_button.dart';
import 'dart:math' as math;

class PlantCard extends StatelessWidget {
  String text;
  Color color;

  PlantCard(String text) {
    this.text = text;
    color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Container(
        height: 230,
        margin: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          overflow: Overflow.visible,
          children: [
            Positioned(
              bottom: 90,
              child: Image(
                image: AssetImage("images/$text.png"),
                width: 130,
              ),
            ),
            Positioned(
              bottom: 45,
              child: Text(
                '${text[3].toUpperCase()}${text.substring(4)}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 205,
              child: RoundIconButton(text, color),
            ),
          ],
        ),
      ),
    );
  }
}
