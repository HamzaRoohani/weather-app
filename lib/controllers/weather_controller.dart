// lib/controllers/weather_controller.dart
import 'package:get/get.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {
  final WeatherService _service = WeatherService();

  var isLoading = false.obs;
  var weather = Rxn<Weather>();
  var error = ''.obs;

  Future<void> fetchWeather(String city) async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await _service.fetchWeatherByCity(city);
      weather.value = result;
    } catch (e) {
      error.value = e.toString();
      weather.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  void clear() {
    weather.value = null;
    error.value = '';
  }
}
