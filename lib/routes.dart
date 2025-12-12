// lib/routes.dart
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => HomeScreen()),
  GetPage(name: '/result', page: () => ResultScreen()),
];
