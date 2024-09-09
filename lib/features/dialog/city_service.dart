import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

abstract class CityService {
  Future<List<String>> loadCities();
  List<String> filterCities(String query, List<String> allCities);
}

class DefaultCityService implements CityService {
  @override
  Future<List<String>> loadCities() async {
    final String response = await rootBundle.loadString('assets/cities.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<String>();
  }

  @override
  List<String> filterCities(String query, List<String> allCities) {
    if (query.isEmpty) return [];
    return allCities
        .where((city) => city.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
  }
}
