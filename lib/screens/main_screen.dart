import 'package:api_exercises/screens/search_screen.dart';
import 'package:api_exercises/services/weather.dart';
import 'package:api_exercises/utilities/character_converter.dart';
import 'package:api_exercises/utilities/constants.dart';
import 'package:api_exercises/utilities/language.dart';
import 'package:api_exercises/widgets/app_bar.dart';
import 'package:api_exercises/widgets/custom_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.locationData});
  final locationData;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Language language = Language();
  Weather weather = Weather();
  CharacterConverter characterConverter = CharacterConverter();
  String temperature;
  String cityName;
  String typedName;
  String feelsLike;
  String weatherIcon;
  String isDay;
  String isTurkey;
  int windSpeed;
  int precipitation;
  int humidity;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = "?";
        cityName = "?";
        feelsLike = "?";
        humidity = 0;
        windSpeed = 0;
        precipitation = 0;
        weatherIcon = "https://i.hizliresim.com/2mndq3s.png";
        isDay = "Veri Yok";
        isTurkey = "Veri Yok";
        return;
      }
      dynamic temp = weatherData['current']['temperature'];
      temperature = temp.toInt().toString();
      cityName = weatherData['location']['name'];
      dynamic feels = weatherData['current']['feelslike'];
      feelsLike = feels.toInt().toString();
      weatherIcon = weatherData['current']['weather_icons'][0];
      isDay = weatherData['current']['is_day'];
      windSpeed = weatherData['current']['wind_speed'].toInt();
      precipitation = weatherData['current']['precip'].toInt();
      humidity = weatherData['current']['humidity'].toInt();
      isTurkey = weatherData['location']['country'];
      if (isTurkey == "Turkey") {
        language.isEnglish = false;
      } else {
        language.isEnglish = true;
      }
    });
  }

  bool get isTurkish {
    return true;
  }

  bool isNight() {
    bool isNight;
    if (isDay == "yes") {
      isNight = false;
    } else if (isDay == "no") {
      isNight = true;
    } else {
      isNight = false;
    }
    return isNight;
  }

  IconData dropIconChoice() {
    IconData myData;
    if (humidity < 50) {
      myData = CupertinoIcons.drop;
    } else {
      myData = CupertinoIcons.drop_fill;
    }
    return myData;
  }

  String humidityDescription() {
    String humidityStr;
    if (humidity < 50) {
      humidityStr = language.isEnglish
          ? '${language.englishTexts[1][1]}'
          : "Nem oranı Düşük";
    } else {
      humidityStr = language.isEnglish
          ? '${language.englishTexts[1][2]}'
          : "Nem oranı Yüksek";
    }
    return humidityStr;
  }

  String windSpeedDescription() {
    String windSpeedStr;
    if (windSpeed >= 0 && windSpeed < 20) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][0]}'
          : "Rüzgar hızı hafif";
    } else if (windSpeed >= 20 && windSpeed < 30) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][1]}'
          : "Rüzgar hızı orta";
    } else if (windSpeed >= 30 && windSpeed < 40) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][2]}'
          : "Rüzgar hızı yüksek";
    } else if (windSpeed >= 40 && windSpeed < 60) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][3]}'
          : "Rüzgar hızı çok yüksek";
    } else if (windSpeed >= 60 && windSpeed < 90) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][4]}'
          : "Fırtına/Kuvvetli Fırtına";
    } else if (windSpeed >= 90 && windSpeed < 118) {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][5]}'
          : "Şiddetli Fırtına";
    } else {
      windSpeedStr = language.isEnglish
          ? '${language.englishTexts[2][6]}'
          : "Hortum/Kasırga";
    }
    return windSpeedStr;
  }

  String precipitationDescription() {
    String precipitationStr;
    if (precipitation >= 0 && precipitation < 30) {
      precipitationStr = language.isEnglish
          ? '${language.englishTexts[3][0]}'
          : "Yağış oranı düşük";
    } else if (precipitation > 30 && precipitation < 70) {
      precipitationStr = language.isEnglish
          ? '${language.englishTexts[3][1]}'
          : "Yağış oranı orta";
    } else if (precipitation > 70 && precipitation < 90) {
      precipitationStr = language.isEnglish
          ? '${language.englishTexts[3][2]}'
          : "Yağış oranı yüksek";
    } else {
      precipitationStr = language.isEnglish
          ? '${language.englishTexts[3][3]}'
          : "Yağış oranı çok yüksek";
    }
    return precipitationStr;
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: CustomAppBar(
            onTapLocation: () async {
              var data = await weather.locationWeatherData();
              updateUI(data);
            },
            onTapSearch: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SearchScreen(
                    isTurkish: language.isEnglish ? false : true,
                    onChange: (String value) {
                      value = characterConverter.convertChars(value);
                      typedName = value;
                    },
                    onTap: () async {
                      var data = await weather.searchedWeatherData(typedName);
                      updateUI(data);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  isNight() ? 'images/night-min.jpg' : 'images/day-min.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: customBorder,
                margin: EdgeInsets.only(left: 44.0, right: 44.0, top: 32.0),
                height: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$cityName', style: kLocationStyle),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                      child: Text('$temperature°C', style: kTempStyle),
                    ),
                    Text(
                        language.isEnglish
                            ? '${language.englishTexts[4][0]} $feelsLike°C'
                            : 'Hissedilen Sıcaklık: $feelsLike°C',
                        style: feelsLikeStyle),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Image(
                          image: NetworkImage('$weatherIcon', scale: 0.5)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: ListView(
                    children: [
                      CustomTile(
                        leadingIcon: dropIconChoice(),
                        titleText: language.isEnglish
                            ? '${language.englishTexts[4][1]}$humidity'
                            : 'Nem: %$humidity',
                        subtitleText: humidityDescription(),
                        textStyle: kWhiteTile,
                      ),
                      CustomTile(
                        leadingIcon: Icons.waves_outlined,
                        titleText: language.isEnglish
                            ? '${language.englishTexts[4][2]} $windSpeed km per hour'
                            : 'Rüzgar Hızı: saatte $windSpeed km',
                        subtitleText: windSpeedDescription(),
                        textStyle: kWhiteTile,
                      ),
                      CustomTile(
                        leadingIcon: CupertinoIcons.cloud_rain,
                        titleText: language.isEnglish
                            ? '${language.englishTexts[4][3]}$precipitation'
                            : 'Yağış: %$precipitation',
                        subtitleText: precipitationDescription(),
                        textStyle: kWhiteTile,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
