import 'package:weather_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:weather_app/features/home/domain/entity/home_entity.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource dataSource;

  WeatherRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<WeatherEntity>> getWeatherInfo(
      double latitude, double longitude) {
    return dataSource.getWeatherInfo(latitude, longitude);
  }

  @override
  Future<List<WeatherEntity>> getWeatherInfoByCity(String cityName) {
    return dataSource.getWeatherInfoByCity(cityName);
  }
}
