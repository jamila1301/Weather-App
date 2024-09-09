import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/assets.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/home/presentation/views/home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff622fb5), Color(0xff1b0f36)],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    top: 103,
                    left: 42,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        AppImages.image1,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 205,
                    right: 13,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        AppImages.image2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 42,
                    child: SizedBox(
                      width: 150,
                      height: 159,
                      child: Image.asset(
                        AppImages.image3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 405,
                    right: 13,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        AppImages.image4,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 274,
                      height: 48,
                      child: Text(
                        'My weather app',
                        style: AppTypography.sp32w600
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(height: 9),
                    SizedBox(
                      width: 274,
                      height: 48,
                      child: Text(
                        'Check Live weather updates all over the world with just one tap',
                        style: AppTypography.sp16w400
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 364,
                      height: 98,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                  weatherBloc:
                                      BlocProvider.of<WeatherBloc>(context)),
                            ),
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: AppColors.lightPurple,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Center(
                            child: Text(
                              'Get started',
                              style: AppTypography.sp32w600
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
