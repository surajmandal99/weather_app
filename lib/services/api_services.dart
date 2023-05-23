import 'package:http/http.dart' as http;
import 'package:weather_app/consts/strings.dart';

import '../modules/current_weather.dart';
import '../modules/hourly_weather_model.dart';

var hourlyLink =
    "https://api.openweathermap.org/data/2.5/forecast?lat=26.4833333&lon=87.2833333&appid=e0083ed34e5be1e5552e4ade6d3a5e19&units=metric";

//fun for getting current weather

getCurrentWeather(lat, long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());

    return data;
  }
}

//fun for getting hourly weather

getHourlyWeather(lat, long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(res.body.toString());

    return data;
  }
}
