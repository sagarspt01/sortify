import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _launchGitHub() async {
    final Uri url = Uri.parse(
      "https://github.com/yourusername/sortify",
    ); // Update with your GitHub link
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

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
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 30),

            // Glowing Title
            const Text(
              "About Sortify",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                shadows: [Shadow(color: Colors.purpleAccent, blurRadius: 20)],
              ),
            ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),

            const SizedBox(height: 24),

            // About Content
            const Text(
              "Sortify is a visual learning tool built with Flutter to help students understand sorting algorithms. "
              "It animates each comparison and swap, making abstract concepts tangible.",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.justify,
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1),

            const SizedBox(height: 24),

            const Text(
              "Features:",
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            ...[
              "• Animated Bubble Sort, Quick Sort, Merge Sort",
              "• Step-by-step visualization",
              "• Sorting summary popup",
              "• Algorithm explanation pages",
            ].map(
              (f) => Text(
                f,
                style: const TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Technologies Used:",
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            ...[
              "• Flutter & Dart",
              "• Provider for state management",
              "• flutter_animate for animations",
              "• Lottie for vector animations",
            ].map(
              (t) => Text(
                t,
                style: const TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Developer Note:",
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "This open-source project is created for learning and educational purposes. "
              "Feel free to contribute or enhance it with more algorithms!",
              style: TextStyle(color: Colors.white70, fontSize: 15),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 30),

            // GitHub Button
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchGitHub,
                icon: const Icon(Icons.link, color: Colors.white),
                label: const Text(
                  "View on GitHub",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  shadowColor: Colors.purpleAccent.shade100,
                  elevation: 12,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ).animate().fadeIn().scale(delay: 200.ms),
            ),

            const SizedBox(height: 40),

            // Footer
            const Center(
              child: Text(
                "© 2025 Sortify | Built with Flutter",
                style: TextStyle(fontSize: 12, color: Colors.white38),
              ),
            ).animate().fadeIn(delay: 500.ms),
          ],
        ),
      ),
    );
  }
}
