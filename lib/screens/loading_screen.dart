import 'package:api_exercises/screens/main_screen.dart';
import 'package:api_exercises/services/weather.dart';
import 'package:api_exercises/utilities/constants.dart';
import 'package:api_exercises/utilities/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Language language = Language();
  Location location = Location();
  bool isWaiting = false;
  void getLocationData() async {
    isWaiting = true;
    var locationData = await Weather().locationWeatherData();
    bool enabled = await location.serviceEnabled();
    if (enabled) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainScreen(
              locationData: locationData,
            );
          },
        ),
      );
    } else {
      return getLocationData();
    }
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Language language = Language();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/city_background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitHourGlass(size: 84.0, color: Colors.white),
                SizedBox(height: 18.0),
                Text(
                  language.isEnglish
                      ? '${language.englishTexts[0][2]}'
                      : 'Konum Alınıyor...',
                  style: kWhiteTile.copyWith(fontSize: 32.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
