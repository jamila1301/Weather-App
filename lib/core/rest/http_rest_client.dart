import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/rest/rest_client.dart';
import 'package:weather_app/features/home/data/model/home_model.dart';

class HttpClient {
  final RestClient restClient;

  HttpClient({
    required this.restClient,
  });

  Future<WeatherModel> getWeather(double latitude, double longitude) async {
    final response =
        await http.get(restClient.getWeatherUri(latitude, longitude));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherModel> getWeatherByCity(String cityName) async {
    final response = await http.get(restClient.getWeatherByCityUri(cityName));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather for city: $cityName');
    }
  }
}
