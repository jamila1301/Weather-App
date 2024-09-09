import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/rest/http_rest_client.dart';
import 'package:weather_app/core/rest/rest_client.dart';
import 'package:weather_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:weather_app/features/home/data/repository/home_repository_impl.dart';
import 'package:weather_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/onboarding/onboarding_page.dart';

void main() {
  final restClient = RestClient(
    baseUrl: 'https://api.openweathermap.org/data/2.5',
    apiKey: '9d81c3f1ee829c82c59affe3f5145dae',
  );
  final httpClient = HttpClient(restClient: restClient);
  final dataSource = WeatherDataSource(httpClient: httpClient);
  final repository = WeatherRepositoryImpl(dataSource: dataSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final WeatherRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(repository: repository),
        ),
      ],
      child: const MaterialApp(
        title: 'Weather App',
        home: OnboardingPage(),
      ),
    );
  }
}
