import 'package:emergenciesevents/core/theme.dart';
import 'package:emergenciesevents/screens/home_screen.dart';
import 'package:flutter/material.dart';

// Yarbis Beltre mercedes
//20220907

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
