import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BubbleSortInfoPage extends StatelessWidget {
  const BubbleSortInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bubble Sort')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Bubble Sort",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Bubble Sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order.",
            ),
            const SizedBox(height: 16),
            const Text(
              "Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Input: [5, 3, 8, 4, 2]\nOutput: [2, 3, 4, 5, 8]"),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                const url = 'https://www.geeksforgeeks.org/bubble-sort/';
                if (await canLaunchUrl(Uri.parse(url))) {
                  launchUrl(
                    Uri.parse(url),
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              icon: const Icon(Icons.link),
              label: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}
