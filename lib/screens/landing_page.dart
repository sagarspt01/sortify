import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'sort_visualizer_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243e)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Futuristic animated Lottie logo
            Lottie.asset(
              'assets/sort_animation.json',
              height: 180,
              repeat: true,
            ),

            const SizedBox(height: 30),

            // Title
            const Text(
              "Sortify",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [Shadow(color: Colors.purpleAccent, blurRadius: 20)],
              ),
            ).animate().fadeIn().slideY(duration: 600.ms, begin: -0.3),

            const SizedBox(height: 16),

            // Tagline
            const Text(
              "Master Sorting Algorithms Visually",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: -0.2),

            const SizedBox(height: 50),

            // Start Button with futuristic glowing animation
            ElevatedButton.icon(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
                  label: const Text(
                    "Start",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.purpleAccent.shade400,
                    elevation: 10,
                    shadowColor: Colors.purpleAccent,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SortVisualizerPage(),
                      ),
                    );
                  },
                )
                .animate()
                .fadeIn(delay: 400.ms)
                .scale(begin: const Offset(0.95, 0.95))
                .shimmer(duration: 1000.ms),

            const SizedBox(height: 30),

            // Footer
            const Text(
              "© 2025 Sortify | Built with Flutter",
              style: TextStyle(fontSize: 12, color: Colors.white38),
            ).animate().fadeIn(delay: 700.ms),
          ],
        ),
      ),
    );
  }
}
