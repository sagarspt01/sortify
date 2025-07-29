import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About This App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Sorting Visualizer",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "This Flutter app is designed to help students and learners understand how sorting algorithms work. "
              "With a visual representation of each step, users can see how elements are compared, swapped, and arranged into order.",
            ),
            SizedBox(height: 16),
            Text("Features:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "• Visual animation for Bubble Sort, Quick Sort, and Merge Sort",
            ),
            Text("• Step-by-step navigation"),
            Text("• Summary of swaps, input, and final output"),
            Text(
              "• Static pages explaining each algorithm with examples and links",
            ),
            SizedBox(height: 16),
            Text(
              "Technology Used:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("• Flutter & Dart"),
            Text("• Provider (State Management)"),
            Text("• Animation and UI Widgets"),
            SizedBox(height: 16),
            Text(
              "Developer Note:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "This project is open for learning and experimentation. "
              "Feel free to expand it with more algorithms and features!",
            ),
          ],
        ),
      ),
    );
  }
}
