// lib/app_bindings.dart
import 'package:get/get.dart';
import 'controllers/weather_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(() => WeatherController());
  }
}
