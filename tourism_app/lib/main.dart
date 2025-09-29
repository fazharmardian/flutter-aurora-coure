import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/screen/detail/detail_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';
import 'package:tourism_app/static/navigation_route.dart';
 
void main() {
 runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
 const MyApp({super.key});
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       useMaterial3: true,
     ),
     initialRoute: NavigationRoute.homeRoute.name,
     routes: {
        NavigationRoute.homeRoute.name: (context) => const HomePage(),
        // NavigationRoute.testRoute.name: (context) => const TestApp(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
        )
     },
   );
 }
}
 

