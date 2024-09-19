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
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

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
                    top: height * 0.1,
                    left: width * 0.1,
                    child: SizedBox(
                      width: width * 0.35,
                      child: Image.asset(
                        AppImages.image1,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.21,
                    right: width * 0.03,
                    child: SizedBox(
                      width: width * 0.35,
                      child: Image.asset(
                        AppImages.image2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.33,
                    left: width * 0.1,
                    child: SizedBox(
                      width: width * 0.35,
                      child: Image.asset(
                        AppImages.image3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.45,
                    right: width * 0.03,
                    child: SizedBox(
                      width: width * 0.35,
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
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My weather app',
                      style: AppTypography.sp32w600
                          .copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: height * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check Live weather updates all',
                          style: AppTypography.sp16w400
                              .copyWith(color: AppColors.white),
                        ),
                        Text(
                          'over the world with just one tap',
                          style: AppTypography.sp16w400
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.11,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                  weatherBloc:
                                      BlocProvider.of<WeatherBloc>(context)),
                            ),
                          );
                        },
                        child: Text(
                          'Get started',
                          style: AppTypography.sp32w600
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
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
