// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final WeatherController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final weather = controller.weather.value;
    if (weather == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: const Center(child: Text('No data')),
      );
    }

    final iconUrl = 'https://openweathermap.org/img/wn/${weather.icon}@2x.png';

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(weather.cityName, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Image.network(iconUrl),
            const SizedBox(height: 12),
            Text('${weather.temp.toStringAsFixed(1)} °C', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text(weather.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Humidity: ${weather.humidity}%', style: const TextStyle(fontSize: 16)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                controller.clear();
                Get.back();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
