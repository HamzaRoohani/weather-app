// lib/models/weather_model.dart
class Weather {
  final String cityName;
  final double temp;
  final String description;
  final int humidity;
  final String icon;

  Weather({
    required this.cityName,
    required this.temp,
    required this.description,
    required this.humidity,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? '',
      temp: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] ?? '',
      humidity: json['main']['humidity'] ?? 0,
      icon: json['weather'][0]['icon'] ?? '01d',
    );
  }
}
