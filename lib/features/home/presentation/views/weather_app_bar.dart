import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/features/dialog/city_dialog.dart';
import 'package:weather_app/features/dialog/city_service.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/home_event.dart';
import 'package:weather_app/features/home/presentation/bloc/home_state.dart';

class WeatherAppBar extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const WeatherAppBar({super.key, required this.weatherBloc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.white,
              size: 25,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              bloc: weatherBloc,
              builder: (context, state) {
                if (state is WeatherLoaded) {
                  return Text(
                    state.weather.first.cityName,
                    style:
                        AppTypography.sp32w600.copyWith(color: AppColors.white),
                  );
                } else if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return Text(
                    'Loading...',
                    style:
                        AppTypography.sp32w600.copyWith(color: AppColors.white),
                  );
                }
              },
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AppColors.white,
            size: 32,
          ),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (BuildContext context) =>
                  CityDialog(cityService: DefaultCityService()),
            );
            if (result != null && result is String) {
              weatherBloc.add(FetchWeatherByCity(result));
            }
          },
        ),
      ],
    );
  }
}
