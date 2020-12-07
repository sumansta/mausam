import 'package:flutter/material.dart';
import 'package:mausam/components/loading_view.dart';
import 'package:mausam/components/today_data.dart';
import 'package:mausam/components/weather_data.dart';
import 'package:mausam/services/weather.dart';
import 'package:mausam/utilities/constants.dart';
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
  var weatherData, hourlyWeatherData;
  bool isLoading = false, isDayTime = true;
  String currentDate;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    getCityWeather();
  }

  void getCityWeather() async {
    setState(() {
      isLoading = true;
    });
    await _getCurrentLocation();
    weatherData = await WeatherModel().getCityWeather(_currentPosition);
    hourlyWeatherData = await WeatherModel().getHourlyWeather(_currentPosition);
    print(weatherData);
    DateTime now = DateTime.now();
    setState(() {
      isLoading = false;
      weatherData = weatherData;
      currentDate = DateFormat.yMMMEd().format(now);
      isDayTime = now.hour < 17 && now.hour > 6;
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
            image: isDayTime
                ? AssetImage('images/day.jpg')
                : AssetImage('images/night.jpg'),
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
            child: isLoading ? LoadingView() : buildWeatherView(),
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
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                          '${weatherData['name']}, ${weatherData['sys']['country']}\n',
                      style: TextStyle(
                        fontFamily: 'FredokaOne',
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: '$currentDate',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    weatherIcons.containsKey(weatherData['weather'][0]['main'])
                        ? weatherIcons[weatherData['weather'][0]['main']]
                        : WeatherIcons.night_clear,
                    size: 32.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${weatherData['main']['temp']}°',
              style: TextStyle(fontSize: 64.0),
            ),
            Text(
                '${weatherData['weather'][0]['main']}  | \tFeels like ${weatherData['main']['feels_like']}°'),
          ],
        ),
        WeatherData(
          weatherData: weatherData,
        ),
        TodayData(
          hourlyWeatherData: hourlyWeatherData,
        ),
        SizedBox(
          height: 10.0,
        ),
        FlatButton(
          focusColor: Colors.transparent,
          onPressed: () {
            this.getCityWeather();
          },
          child: Text('Refresh'),
        ),
      ],
    );
  }
}
