import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'name')
  final String cityName;

  @JsonKey(name: 'main')
  final MainInfo mainInfo;

  @JsonKey(name: 'weather')
  final List<WeatherInfo> weatherInfo;

  @JsonKey(name: 'dt')
  final int timestamp;

  WeatherModel({
    required this.cityName,
    required this.mainInfo,
    required this.weatherInfo,
    required this.timestamp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class MainInfo {
  @JsonKey(name: 'temp')
  final double temp;

  MainInfo({
    required this.temp,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}

@JsonSerializable()
class WeatherInfo {
  @JsonKey(name: 'description')
  final String description;

  WeatherInfo({
    required this.description,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
