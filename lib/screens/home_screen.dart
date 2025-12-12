// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final WeatherController controller = Get.find();
  final TextEditingController cityController = TextEditingController();

  void _search() {
    final city = cityController.text.trim();
    if (city.isNotEmpty) {
      controller.fetchWeather(city).then((_) {
        if (controller.error.value.isEmpty && controller.weather.value != null) {
          Get.toNamed('/result');
        } else {
          Get.snackbar('Error', controller.error.value,
              snackPosition: SnackPosition.BOTTOM);
        }
      });
    } else {
      Get.snackbar('Input required', 'Please enter a city name',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'Enter city name (e.g., Islamabad)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _search,
                child: const Text('Get Weather'),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.error.value.isNotEmpty) {
                return Text('Error: ${controller.error.value}');
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
