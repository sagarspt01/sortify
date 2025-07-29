import 'package:flutter/material.dart';
import 'package:sortify/snippets/insertion_sort_c.dart';
import 'package:sortify/snippets/insertion_sort_cpp.dart';
import 'package:sortify/snippets/insertion_sort_python.dart';
import 'package:sortify/widgets/code_snippet.dart';
import 'package:url_launcher/url_launcher.dart';

class InsertionSortInfoPage extends StatefulWidget {
  const InsertionSortInfoPage({super.key});

  @override
  State<InsertionSortInfoPage> createState() => _InsertionSortInfoPageState();
}

class _InsertionSortInfoPageState extends State<InsertionSortInfoPage> {
  final ScrollController _scrollController = ScrollController();

  static final Uri _url = Uri.parse(
    'https://www.geeksforgeeks.org/insertion-sort/',
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
      'C': selectionSortC,
      'C++': insertionSortCpp,
      'Python': insertionSortPython,
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243e)],
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
                    "Insertion Sort",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.purpleAccent, blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Insertion Sort is a simple sorting algorithm that builds the final sorted array one item at a time. "
                    "It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort.",
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Pseudocode:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
for i = 1 to length(A) - 1:
    key = A[i]
    j = i - 1
    while j >= 0 and A[j] > key:
        A[j + 1] = A[j]
        j = j - 1
    A[j + 1] = key
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Step-by-step Example (Input: [5, 3, 8, 4, 2]):",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
i=1 → [3, 5, 8, 4, 2]
i=2 → [3, 5, 8, 4, 2]
i=3 → [3, 4, 5, 8, 2]
i=4 → [2, 3, 4, 5, 8]
Output: [2, 3, 4, 5, 8]
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Code Snippets:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
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
                    "Best Case: O(n) (already sorted)\n"
                    "Average Case: O(n²)\n"
                    "Worst Case: O(n²)",
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Space Complexity:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text("O(1) — In-place sorting"),
                  const SizedBox(height: 24),
                  const Text(
                    "Advantages & Disadvantages:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
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
                            child: Text('Simple to understand and implement'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Inefficient for large lists'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Efficient for small data sets'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('O(n²) in worst case'),
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
                        backgroundColor: Colors.purpleAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: Colors.purpleAccent,
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
