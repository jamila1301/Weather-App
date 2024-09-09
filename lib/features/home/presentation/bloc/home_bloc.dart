import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather =
            await repository.getWeatherInfo(event.latitude, event.longitude);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    on<FetchWeatherByCity>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await repository.getWeatherInfoByCity(event.cityName);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
