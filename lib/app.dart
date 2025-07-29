import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

class SortingApp extends StatelessWidget {
  const SortingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorting Visualizer',
      theme: ThemeData.dark(),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
