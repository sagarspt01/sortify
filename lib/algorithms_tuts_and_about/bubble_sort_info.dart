import 'package:flutter/material.dart';
import 'package:sortify/snippets/bubble_sort_c.dart';
import 'package:sortify/snippets/bubble_sort_cpp.dart';
import 'package:sortify/snippets/bubble_sort_python.dart';
import 'package:sortify/widgets/code_snippet.dart';
import 'package:url_launcher/url_launcher.dart';

class BubbleSortInfoPage extends StatelessWidget {
  const BubbleSortInfoPage({super.key});

  static final Uri _url = Uri.parse(
    'https://www.geeksforgeeks.org/bubble-sort/',
  );

  Future<void> _launchURL(BuildContext context) async {
    try {
      final bool launched = await launchUrl(
        _url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        _showSnackBar(context, 'Could not open the URL.');
      }
    } catch (e) {
      _showSnackBar(context, 'Error: ${e.toString()}');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final codeMap = {
      'C': bubbleSortC,
      'C++': bubbleSortCpp,
      'Python': bubbleSortPython,
    };

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
            const SizedBox(height: 12),
            const Text(
              "Bubble Sort is a simple comparison-based algorithm where each pair of adjacent elements is compared, and the elements are swapped if they are in the wrong order.",
            ),
            const SizedBox(height: 16),

            // Code Snippet Section (Moved Up)
            const Text(
              "Code Snippets:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CodeSnippetTab(codeMap: codeMap),
            const SizedBox(height: 24),

            const Text(
              "Step-by-step Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              "Input: [5, 3, 8, 4, 2]\n"
              "Step 1: [3, 5, 8, 4, 2]\n"
              "Step 2: [3, 5, 4, 8, 2]\n"
              "Step 3: [3, 5, 4, 2, 8]\n"
              "Step 4: [3, 4, 5, 2, 8]\n"
              "Step 5: [3, 4, 2, 5, 8]\n"
              "Step 6: [3, 2, 4, 5, 8]\n"
              "Step 7: [2, 3, 4, 5, 8]\n"
              "Output: [2, 3, 4, 5, 8]",
            ),
            const SizedBox(height: 16),

            const Text(
              "Time Complexity:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              "Best Case: O(n) (already sorted)\n"
              "Average Case: O(n²)\n"
              "Worst Case: O(n²)",
            ),
            const SizedBox(height: 8),

            const Text(
              "Space Complexity:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("O(1) — In-place sorting"),
            const SizedBox(height: 16),

            const Text(
              "Advantages:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("• Simple to implement\n• Good for small datasets"),
            const SizedBox(height: 8),

            const Text(
              "Disadvantages:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              "• Inefficient for large datasets\n• High time complexity",
            ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () => _launchURL(context),
              icon: const Icon(Icons.link),
              label: const Text('Read More on GeeksforGeeks'),
            ),
          ],
        ),
      ),
    );
  }
}
