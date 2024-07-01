import 'package:datetime/screen/home_screen.dart';
import 'package:datetime/speed_test_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Speed Test',
      theme: FlexThemeData.light(scheme: FlexScheme.green,useMaterial3: true),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.green,useMaterial3: true),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}

