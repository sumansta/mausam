import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/components/today_data.dart';
import 'package:mausam/components/weather_data.dart';
import 'package:mausam/services/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = WeatherModel();
  var weatherData;
  bool _onLoading = false;
  int temperature = 25;
  String cityName, currentDate;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    getCityWeather();
  }

  void getCityWeather() async {
    setState(() {
      _onLoading = true;
    });
    await _getCurrentLocation();
    weatherData = await WeatherModel().getCityWeather(_currentPosition);
    DateTime now = DateTime.now();

    setState(() {
      _onLoading = false;
      weatherData = weatherData;
      currentDate = DateFormat('yyyy-MM-dd').format(now);
    });
  }

  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    return;
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
            child: _onLoading ? LoadingView() : buildWeatherView(),
          ),
        ),
      ),
    );
  }

  Column buildWeatherView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              WeatherIcons.thunderstorm,
              size: 80.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${weatherData['main']['temp']}°',
              style: GoogleFonts.fredokaOne(
                textStyle: TextStyle(fontSize: 86.0),
              ),
            ),
            Text(
              '${weatherData['name']}',
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
          weatherData: weatherData,
        ),
        TodayData(),
        SizedBox(
          height: 10.0,
        ),
        FlatButton(
          onPressed: () {
            this.getCityWeather();
          },
          child: Text('Refresh'),
        ),
      ],
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 48,
          ),
          Text(
            'Loading weather data . . .',
            style: GoogleFonts.fredokaOne(
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
