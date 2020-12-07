import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const kPrimaryColor = Color(0xFF1b4b45);

Map<String, IconData> weatherIcons = {
  "Thunderstorm": WeatherIcons.thunderstorm,
  "Clouds": WeatherIcons.cloudy,
  "Drizzle": WeatherIcons.day_rain,
  "Rain": WeatherIcons.rain,
  "Snow": WeatherIcons.snow,
  "Clear": WeatherIcons.night_clear,
  "Atmosphere": WeatherIcons.refresh
};
