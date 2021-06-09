import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  CustomTile(
      {this.leadingIcon, this.titleText, this.subtitleText, this.textStyle});

  final IconData leadingIcon;
  final String titleText;
  final String subtitleText;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    //MainScreen mainScreen = MainScreen();
    return Padding(
      padding: EdgeInsets.only(top: 12.0, left: 32.0, right: 28.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(leadingIcon, size: 32, color: Colors.blue)],
        ),
        title: Text(
          titleText,
          style: textStyle,
        ),
        subtitle: Text(subtitleText, style: textStyle),
      ),
    );
  }
}
