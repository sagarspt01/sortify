import 'package:flutter/material.dart';
import 'package:sortify/snippets/merge_sort_c.dart';
import 'package:sortify/snippets/merge_sort_cpp.dart';
import 'package:sortify/snippets/merge_sort_python.dart';
import 'package:sortify/widgets/code_snippet.dart';
import 'package:url_launcher/url_launcher.dart';

class MergeSortInfoPage extends StatefulWidget {
  const MergeSortInfoPage({super.key});

  @override
  State<MergeSortInfoPage> createState() => _MergeSortInfoPageState();
}

class _MergeSortInfoPageState extends State<MergeSortInfoPage> {
  final ScrollController _scrollController = ScrollController();

  static final Uri _url = Uri.parse(
    'https://www.geeksforgeeks.org/merge-sort/',
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final codeMap = {
      'C': mergeSortC,
      'C++': mergeSortCpp,
      'Python': mergeSortPython,
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(20),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Merge Sort",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.blueAccent, blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Merge Sort is a divide and conquer algorithm that divides the array into halves, sorts them recursively, and merges them.",
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Pseudocode:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
function mergeSort(arr):
    if length of arr > 1:
        mid = length of arr // 2
        left_half = arr[:mid]
        right_half = arr[mid:]

        mergeSort(left_half)
        mergeSort(right_half)

        merge(left_half, right_half, arr)
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Step-by-step Example (Input: [38, 27, 43, 3, 9, 82, 10]):",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
Divide: [38, 27, 43] and [3, 9, 82, 10]
Recursive division until one element
Merge: [27, 38, 43], [3, 9, 10, 82]
Final Merge: [3, 9, 10, 27, 38, 43, 82]
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Code Snippets:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CodeSnippetTab(codeMap: codeMap),
                  const SizedBox(height: 24),
                  const Text(
                    "Time Complexity:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Best Case: O(n log n)\n"
                    "Average Case: O(n log n)\n"
                    "Worst Case: O(n log n)",
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Space Complexity:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text("O(n) — due to auxiliary arrays"),
                  const SizedBox(height: 24),
                  const Text(
                    "Advantages & Disadvantages:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Table(
                    border: TableBorder.all(color: Colors.white24),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                    },
                    children: const [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.white10),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Advantages',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Disadvantages',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Stable sort'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Requires additional space'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Consistent O(n log n) time'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Slower than in-place sorts for small lists',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(context),
                      icon: const Icon(Icons.link, color: Colors.white),
                      label: const Text(
                        'Read More on GeeksforGeeks',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
