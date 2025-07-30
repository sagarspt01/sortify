import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/landing_page.dart';

class SortingApp extends StatefulWidget {
  const SortingApp({super.key});

  @override
  State<SortingApp> createState() => _SortingAppState();
}

class _SortingAppState extends State<SortingApp> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Wait for app initialization
    await Future.delayed(const Duration(seconds: 2));

    // Add safety check before removing splash
    if (mounted) {
      FlutterNativeSplash.remove();
    }
  }

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
