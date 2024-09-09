class RestClient {
  final String baseUrl;
  final String apiKey;

  RestClient({
    required this.baseUrl,
    required this.apiKey,
  });

  Uri getWeatherUri(double latitude, double longitude) {
    return Uri.parse(
        '$baseUrl/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
  }

  Uri getWeatherByCityUri(String cityName) {
    return Uri.parse('$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric');
  }
}
