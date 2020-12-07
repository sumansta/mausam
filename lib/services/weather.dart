import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

var apiKey = DotEnv().env['OPEN_WEATHER_MAP_API_KEY'];
const getApi = 'https://api.openweathermap.org/data/2.5/weather';

const getHourlyApi = 'https://api.openweathermap.org/data/2.5/onecall';

class WeatherModel {
  Future<dynamic> getCityWeather(Position position) async {
    double lat = position.latitude, lon = position.longitude;
    http.Response response =
        await http.get('$getApi?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    return jsonDecode(response.body);
  }

  Future<dynamic> getHourlyWeather(Position position) async {
    double lat = position.latitude, lon = position.longitude;
    http.Response response = await http.get(
        '$getHourlyApi?lat=$lat&lon=$lon&exclude=current,minutely,daily,alerts&appid=$apiKey&units=metric');
    return jsonDecode(response.body);
  }
}
