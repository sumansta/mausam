import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Today',
                style: GoogleFonts.fredokaOne(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Tuesday, March 31, 2020',
                style: GoogleFonts.fredokaOne(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TodayDataComponent(
                value: '14',
                icon: WeatherIcons.sunrise,
                time: 'Now',
              ),
              TodayDataComponent(
                value: '16',
                icon: WeatherIcons.day_sunny,
                time: '10am',
              ),
              TodayDataComponent(
                value: '17',
                icon: WeatherIcons.day_sunny,
                time: '11am',
              ),
              TodayDataComponent(
                value: '17',
                icon: WeatherIcons.day_sunny_overcast,
                time: '12pm',
              ),
              TodayDataComponent(
                value: '19',
                icon: WeatherIcons.day_sunny_overcast,
                time: '1pm',
              ),
              TodayDataComponent(
                value: '19',
                icon: WeatherIcons.day_cloudy,
                time: '2pm',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TodayDataComponent extends StatelessWidget {
  TodayDataComponent(
      {@required this.value, @required this.icon, @required this.time});

  final String value;
  final IconData icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$value°',
          style: GoogleFonts.fredokaOne(
            fontWeight: FontWeight.normal,
          ),
        ),
        Icon(
          icon,
          size: 18.0,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          time,
          style: GoogleFonts.fredokaOne(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
