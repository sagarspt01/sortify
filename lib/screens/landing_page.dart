import 'package:flutter/material.dart';
import 'sort_visualizer_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset("assets/logo.png", height: 100),

            const SizedBox(height: 20),

            // Title
            const Text(
              "Sorting Visualizer",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            // Start Button
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow, size: 28),
              label: const Text("Start", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SortVisualizerPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
