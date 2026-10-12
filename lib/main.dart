import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const CrystreeApp());
}

class CrystreeApp extends StatelessWidget {
  const CrystreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crystree Solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B1F4B), // navy from logo
        ),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}