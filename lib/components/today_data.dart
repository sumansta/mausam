import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mausam/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';

class TodayData extends StatelessWidget {
  const TodayData({Key key, this.hourlyWeatherData}) : super(key: key);
  final hourlyWeatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.30),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: getTodayWeatherComponents(hourlyWeatherData),
          )
        ],
      ),
    );
  }
}

Widget getTodayWeatherComponents(hourlyWeatherData) {
  List<TodayDataComponent> list = new List<TodayDataComponent>();
  for (var item in hourlyWeatherData['hourly']) {
    list.add(
      new TodayDataComponent(
        value: '${item['temp']}',
        icon: weatherIcons.containsKey(item['weather'][0]['main'])
            ? weatherIcons[item['weather'][0]['main']]
            : WeatherIcons.refresh,
        time: new DateFormat.Hm()
            .format(new DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000)),
      ),
    );
  }
  return new Row(
    children: list,
  );
}

class TodayDataComponent extends StatelessWidget {
  TodayDataComponent(
      {@required this.value, @required this.icon, @required this.time});

  final String value;
  final IconData icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value°',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Icon(
            icon,
            size: 18.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            time,
          ),
        ],
      ),
    );
  }
}
