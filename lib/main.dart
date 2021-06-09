import 'package:api_exercises/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(HowADurumu());

class HowADurumu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
