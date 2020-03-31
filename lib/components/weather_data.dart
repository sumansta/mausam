import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData extends StatefulWidget {
  WeatherData({this.wind});

  int high;
  int wind;
  int humidity;
  int visibility;

  @override
  State<StatefulWidget> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  var wind;
  @override
  void initState() {
    super.initState();
    wind = widget.wind;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DataComponent(
          icon: WeatherIcons.thermometer_exterior,
          label: 'High/Low',
          value: '10',
        ),
        DataComponent(
          icon: WeatherIcons.strong_wind,
          label: 'Wind',
          value: '$wind kph',
        ),
        DataComponent(
          icon: WeatherIcons.humidity,
          label: 'Humidity',
          value: '86%',
        ),
        DataComponent(
          icon: WeatherIcons.alien,
          label: 'Visibility',
          value: '10 km',
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
              style: GoogleFonts.fredokaOne(
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              value,
              style: GoogleFonts.fredokaOne(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
