import 'dart:ui';

import 'package:api_exercises/utilities/constants.dart';
import 'package:api_exercises/utilities/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final Function onChange, onTap;
  final bool isTurkish;
  SearchScreen({this.onChange, this.onTap, this.isTurkish});

  @override
  Widget build(BuildContext context) {
    Language language = Language();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/location_background-min.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(isTurkish ? 'KONUM ARA' : '${language.englishTexts[5][0]}',
                style: kStyle),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: TextField(
                autofocus: true,
                onChanged: onChange,
                style: kStyle,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                textCapitalization: TextCapitalization.sentences,
                cursorHeight: 27,
                cursorColor: Colors.blueGrey,
                decoration: kInputDecoration.copyWith(
                  labelText: isTurkish
                      ? 'KONUM ARA'
                      : '${language.englishTexts[5][1]}',
                ),
              ),
            ),
            RaisedButton.icon(
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: onTap,
                icon: Icon(CupertinoIcons.checkmark_alt),
                label: Text(
                    isTurkish ? 'KONUM ARA' : '${language.englishTexts[5][2]}'))
          ],
        ),
      ),
    );
  }
}
