import 'package:flutter/material.dart';
import 'package:sortify/snippets/heap_sort_c.dart';
import 'package:sortify/snippets/heap_sort_cpp.dart';
import 'package:sortify/snippets/heap_sort_python.dart';
import 'package:sortify/widgets/code_snippet.dart';
import 'package:url_launcher/url_launcher.dart';

class HeapSortInfoPage extends StatefulWidget {
  const HeapSortInfoPage({super.key});

  @override
  State<HeapSortInfoPage> createState() => _HeapSortInfoPageState();
}

class _HeapSortInfoPageState extends State<HeapSortInfoPage> {
  final ScrollController _scrollController = ScrollController();

  static final Uri _url = Uri.parse('https://www.geeksforgeeks.org/heap-sort/');

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
      'C': heapSortC,
      'C++': heapSortCpp,
      'Python': heapSortPython,
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
                    "Heap Sort",
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
                    "Heap Sort is a comparison-based sorting algorithm that uses a binary heap data structure. It works by converting the array into a max heap and repeatedly extracting the maximum element.",
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
buildMaxHeap(arr)
for i from n - 1 downto 1:
    swap arr[0] with arr[i]
    heapify(arr, 0, i)
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Step-by-step Example (Input: [4, 10, 3, 5, 1]):",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
Build Max Heap: [10, 5, 3, 4, 1]
Remove 10: [5, 4, 3, 1, 10]
Remove 5: [4, 1, 3, 5, 10]
Remove 4: [3, 1, 4, 5, 10]
Remove 3: [1, 3, 4, 5, 10]
Output: [1, 3, 4, 5, 10]
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
                            child: Text('In-place, no extra memory'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Not stable'),
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
                            child: Text('Not adaptive to input'),
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
