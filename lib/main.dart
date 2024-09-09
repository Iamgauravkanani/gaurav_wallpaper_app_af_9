import 'package:flutter/material.dart';
import 'package:wallpaper_app_af_9/Views/Screens/wallpaper_detail.dart';
import 'Views/Screens/splash.dart';
import 'Views/Screens/wallpaper_api.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => Splash_Screen(),
        '/home': (context) => Wallpaper_Screen(),
        'detail': (context) => Details_Page(),
      },
    ),
  );
}
