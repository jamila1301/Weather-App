import 'package:weather_app/features/home/domain/entity/home_entity.dart';

abstract class WeatherRepository {
  Future<List<WeatherEntity>> getWeatherInfo(double latitude, double longitude);
  Future<List<WeatherEntity>> getWeatherInfoByCity(String cityName);
}
