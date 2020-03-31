import 'dart:convert';
import 'package:http/http.dart' as http;

const city = 'Kathmandu';
const apiKey = '6690a706f03dad08e43980aed12a2555';
const getApi = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather() async {
    http.Response response =
        await http.get('$getApi?q=$city&appid=$apiKey&units=metric');
    return jsonDecode(response.body);
  }
}
