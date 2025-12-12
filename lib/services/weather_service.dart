import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  static final String _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
  static const String _baseUrl = 'api.openweathermap.org';

  Future<Weather> fetchWeatherByCity(String city) async {
    final uri = Uri.https(_baseUrl, '/data/2.5/weather', {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return Weather.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load weather: ${response.body}');
    }
  }
}
