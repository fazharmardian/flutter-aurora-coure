import 'package:flutter/material.dart';
import 'package:quizz_1/static/navigation_route.dart';

import '../../widgets/panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MyPanel(title: 'Panel Informasi'),
          ElevatedButton(
            onPressed: () => navigate(context, NavigationRoute.profileRoute.name),
            child: Text('Ke Profile'),
          ),
          const SizedBox(height: 12),
           ElevatedButton(
            onPressed: () => navigate(context, NavigationRoute.settingsRoute.name),
            child: Text('Ke Settings'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => navigate(context, NavigationRoute.aboutRoute.name),
            child: Text('Ke About'),
          ),
          const SizedBox(height: 12),
          MyPanel(title: 'Panel Informasi'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {
          bottomBarNavigation(i, context);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

void navigate(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}

void bottomBarNavigation(int i, BuildContext context) {
  switch (i) {
    case 0:
      Navigator.pushNamed(context, '/');
      break;
    case 1:
      Navigator.pushNamed(context, '/profile');
      break;
    case 2:
      Navigator.pushNamed(context, '/settings');
      break;
  }
}
