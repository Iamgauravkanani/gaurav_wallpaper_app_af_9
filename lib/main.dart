import 'package:flutter/material.dart';
import 'package:wallpaper_app_af_9/Views/Screens/wallpaper_detail.dart';

import 'Views/Screens/home_screen.dart';
import 'Views/Screens/multiple_responce_data_screen.dart';
import 'Views/Screens/wallpaper_api.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => Wallpaper_Screen(),
        'detail': (context) => Details_Page(),
      },
    ),
  );
}
