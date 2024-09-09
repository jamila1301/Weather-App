import 'package:weather_app/features/home/data/model/home_model.dart';
import 'package:weather_app/features/home/domain/entity/home_entity.dart';

class WeatherMapper {
  static WeatherEntity fromModel(WeatherModel model) {
    return WeatherEntity(
      cityName: model.cityName,
      temperature: model.mainInfo.temp,
      description: model.weatherInfo.first.description,
      date: DateTime.fromMillisecondsSinceEpoch(model.timestamp * 1000),
    );
  }
}
