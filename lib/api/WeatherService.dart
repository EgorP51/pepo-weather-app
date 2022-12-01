import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/Constant.dart';
import 'package:weather_app/utilities/Location.dart';
import '../models/Weather.dart';

class WeatherApi {

  static final _apiKey = Constant.API_KEY;

  static Future<Weather> fetchCurrentWeather() async {

    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();

    String lat = currentLocation.latitude.toString();
    String lon = currentLocation.longitude.toString();

    var url =
    Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}