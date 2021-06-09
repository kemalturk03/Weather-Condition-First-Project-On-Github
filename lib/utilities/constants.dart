import 'dart:ui';

import 'package:flutter/material.dart';

const kStyle = TextStyle(fontSize: 22, color: Colors.white);
const kLocationStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.w900,
  color: Color(0xFF501284),
);
const kTempStyle = TextStyle(
  fontSize: 36.0,
  fontWeight: FontWeight.w900,
  color: Color(0xFF000000),
);
const feelsLikeStyle = TextStyle(
    color: Color(0xFF4C4C4C), fontSize: 18.0, fontWeight: FontWeight.w900);

const kInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.white),
  filled: false,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      borderSide: BorderSide(color: Colors.white)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
    borderSide: BorderSide(color: Colors.blueGrey),
  ),
);

const customBorder = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(16.0)),
);

const kWhiteTile = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const kBlackTile = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

const kDialogStyle = TextStyle(
    fontSize: 26, fontWeight: FontWeight.w300, fontFamily: 'SquadaOne');
