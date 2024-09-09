import 'package:weather_app/core/constants/assets.dart';

class WeatherImageMapper {
  static String getImage(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
      case 'clear':
      case 'mostly clear':
      case 'hot':
        return AppImages.image5;
      case 'few clouds':
      case 'partly cloudy':
      case 'scattered clouds':
      case 'broken clouds':
        return AppImages.image7;
      case 'overcast clouds':
      case 'mostly cloudy':
      case 'overcast':
        return AppImages.image6;
      case 'shower rain':
      case 'light intensity drizzle':
        return AppImages.image8;
      case 'light snow':
      case 'snow':
        return AppImages.image9;
      case 'mist':
      case 'fog':
        return AppImages.image11;
      case 'thunderstorm':
        return AppImages.image10;
      default:
        return AppImages.image11;
    }
  }
}
