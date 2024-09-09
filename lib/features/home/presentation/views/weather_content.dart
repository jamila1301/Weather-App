import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/features/home/domain/entity/home_entity.dart';
import 'package:weather_app/features/home/presentation/views/weather_image_mapper.dart';

class WeatherContent extends StatelessWidget {
  final List<WeatherEntity> weatherList;

  const WeatherContent({super.key, required this.weatherList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  WeatherImageMapper.getImage(weatherList.first.description),
                  width: 284,
                  height: 207,
                ),
                Text(
                  '${weatherList.first.temperature}°',
                  style:
                      AppTypography.sp82w600.copyWith(color: AppColors.white),
                ),
                Text(
                  weatherList.first.description,
                  style:
                      AppTypography.sp20w400.copyWith(color: AppColors.white),
                ),
                Text(
                  '${weatherList.first.date.day}/${weatherList.first.date.month}/${weatherList.first.date.year}',
                  style:
                      AppTypography.sp20w400.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
