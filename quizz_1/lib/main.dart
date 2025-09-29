import 'package:flutter/material.dart';
import 'package:quizz_1/screens/about/about_screen.dart';
import 'package:quizz_1/static/navigation_route.dart';

import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/setting/setting_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studi Kasus Routing (1 File)',
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => const HomeScreen(),
        NavigationRoute.profileRoute.name: (context) => const ProfileScreen(),
        NavigationRoute.settingsRoute.name: (context) => const SettingsScreen(),
        NavigationRoute.aboutRoute.name: (context) => const AboutScreen(),
      },
    );
  }
}
