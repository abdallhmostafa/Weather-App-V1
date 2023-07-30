import 'package:flutter/material.dart';
import 'package:weather_appv1/screens/loading.dart';
import 'package:weather_appv1/screens/location.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      title: "Weather",

      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (_) =>const LoadingScreen(),
        '/home' : (_) =>const Home(),
        '/location' : (_) =>const LocationScreen(),


      },
      initialRoute: '/',
    );
  }
}
