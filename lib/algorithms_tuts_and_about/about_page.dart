import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _launchGitHub() async {
    final Uri url = Uri.parse("https://github.com/sagarspt01");

    try {
      // First try to launch with external application mode
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // If external application mode fails, try platform default
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      // Show error dialog if URL launching fails
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    // Note: This requires a BuildContext, so we'll handle it differently
    debugPrint('Failed to launch URL: https://github.com/sagarspt01');
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

            // GitHub Button with improved error handling
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse("https://github.com/sagarspt01");

                  try {
                    // Try different launch modes
                    bool launched = false;

                    // First try external application
                    if (await canLaunchUrl(url)) {
                      launched = await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }

                    // If that fails, try platform default
                    if (!launched) {
                      launched = await launchUrl(
                        url,
                        mode: LaunchMode.platformDefault,
                      );
                    }

                    // If still fails, try in-app web view
                    if (!launched) {
                      launched = await launchUrl(
                        url,
                        mode: LaunchMode.inAppWebView,
                      );
                    }

                    if (!launched) {
                      throw Exception('Could not launch URL');
                    }
                  } catch (e) {
                    // Show error dialog with context
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.grey.shade900,
                            title: const Text(
                              'Error',
                              style: TextStyle(color: Colors.purpleAccent),
                            ),
                            content: const Text(
                              'Could not open GitHub link. Please visit:\nhttps://github.com/sagarspt01',
                              style: TextStyle(color: Colors.white70),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.purpleAccent),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
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
