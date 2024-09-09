import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'weather_location_service.dart';

void fetchWeatherByLocation(WeatherBloc weatherBloc) async {
  final locationService = WeatherLocationService();
  try {
    final position = await locationService.determinePosition();
    weatherBloc.add(FetchWeather(position.latitude, position.longitude));
  } catch (error) {
    weatherBloc.add(FetchWeather(41.01384, 28.94966));
  }
}
