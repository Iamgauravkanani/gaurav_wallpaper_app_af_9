import 'package:flutter/material.dart';

import 'Views/Screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => HomeScreen(),
      },
    ),
  );
}
