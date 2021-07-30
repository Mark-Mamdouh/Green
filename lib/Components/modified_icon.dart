import 'package:flutter/material.dart';

class ModifiedIcon extends StatelessWidget {

  Icon icon;
  Text text;
  Function onPress;
  Color color;

  ModifiedIcon(Icon icon, Text text, Function onPress, Color color) {
    this.icon = icon;
    this.text = text;
    this.onPress = onPress;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: onPress,
          child: Column(
            children: [
              icon,
              text,
            ],
          ),
        ),
      ),
    );
  }
}
