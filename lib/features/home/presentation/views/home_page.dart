import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/features/home/presentation/views/fetch_weather_by_location.dart';
import 'package:weather_app/features/home/presentation/views/weather_app_bar.dart';
import 'package:weather_app/features/home/presentation/views/weather_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const HomePage({super.key, required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    fetchWeatherByLocation(weatherBloc);

    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        automaticallyImplyLeading: false,
        title: WeatherAppBar(weatherBloc: weatherBloc),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            final weatherList = state.weather;
            return WeatherContent(weatherList: weatherList);
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
