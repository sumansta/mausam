import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({Key key, this.weatherData}) : super(key: key);

  final weatherData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DataComponent(
          icon: WeatherIcons.direction_up,
          label: 'High/Low',
          value:
              '${weatherData['main']['temp_max']}/${weatherData['main']['temp_min']}',
        ),
        DataComponent(
          icon: WeatherIcons.strong_wind,
          label: 'Wind',
          value: '${weatherData['wind']['speed']} kph',
        ),
        DataComponent(
          icon: WeatherIcons.humidity,
          label: 'Humidity',
          value: '${weatherData['main']['humidity']}%',
        ),
        DataComponent(
          icon: WeatherIcons.alien,
          label: 'Visibility',
          value: '${weatherData['visibility']} m',
        ),
      ],
    );
  }
}

class DataComponent extends StatelessWidget {
  DataComponent(
      {@required this.icon, @required this.label, @required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              size: 24.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
