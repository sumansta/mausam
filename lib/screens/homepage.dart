import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/components/today_data.dart';
import 'package:mausam/components/weather_data.dart';
import 'package:mausam/services/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = WeatherModel();
  var weatherData;
  int temperature = 25;
  String cityName = 'Kathmandu';
  String currentDate = '31 Mar, 2020';

  @override
  void initState() {
    super.initState();

    getCityWeather();
  }

  void getCityWeather() async {
    weatherData = await WeatherModel().getCityWeather();
    DateTime now = DateTime.now();
    setState(() {
      weatherData = weatherData;
      currentDate = DateFormat('yyyy-MM-dd').format(now);
    });
    if (weatherData != null) {
      temperature = weatherData['main']['temp'];
      cityName = weatherData['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/day.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 36.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      WeatherIcons.night_alt_cloudy,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '$temperature°',
                      style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(fontSize: 86.0),
                      ),
                    ),
                    Text(
                      '$cityName',
                      style: GoogleFonts.fredokaOne(
                        textStyle: TextStyle(fontSize: 48.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        '$currentDate',
                        style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ),
                  ],
                ),
                WeatherData(
                  wind: 13,
                ),
                TodayData(),
                SizedBox(
                  height: 10.0,
                ),
                // FlatButton(
                //   onPressed: () {
                //     this.getCityWeather();
                //   },
                //   child: Text('Refresh'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
