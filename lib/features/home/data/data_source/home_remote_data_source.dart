import 'package:weather_app/core/rest/http_rest_client.dart';
import 'package:weather_app/features/home/data/mapper/home_mapper.dart';
import 'package:weather_app/features/home/domain/entity/home_entity.dart';

class WeatherDataSource {
  final HttpClient httpClient;

  WeatherDataSource({
    required this.httpClient,
  });

  Future<List<WeatherEntity>> getWeatherInfo(
      double latitude, double longitude) async {
    final weatherModel = await httpClient.getWeather(latitude, longitude);
    return [WeatherMapper.fromModel(weatherModel)];
  }

  Future<List<WeatherEntity>> getWeatherInfoByCity(String cityName) async {
    final weatherModel = await httpClient.getWeatherByCity(cityName);
    return [WeatherMapper.fromModel(weatherModel)];
  }
}
