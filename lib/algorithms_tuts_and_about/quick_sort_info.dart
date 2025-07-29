import 'package:flutter/material.dart';
import 'package:sortify/snippets/quick_sort_c.dart';
import 'package:sortify/snippets/quick_sort_cpp.dart';
import 'package:sortify/snippets/quick_sort_python.dart';
import 'package:sortify/widgets/code_snippet.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickSortInfoPage extends StatefulWidget {
  const QuickSortInfoPage({super.key});

  @override
  State<QuickSortInfoPage> createState() => _QuickSortInfoPageState();
}

class _QuickSortInfoPageState extends State<QuickSortInfoPage> {
  final ScrollController _scrollController = ScrollController();

  static final Uri _url = Uri.parse(
    'https://www.geeksforgeeks.org/quick-sort/',
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
      'C': quickSortC,
      'C++': quickSortCpp,
      'Python': quickSortPython,
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D2B64), Color(0xFFF8CDDA)],
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
                    "Quick Sort",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.redAccent, blurRadius: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Quick Sort is a divide-and-conquer algorithm. It picks an element as a pivot and partitions the array around the picked pivot.",
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Pseudocode:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
function quickSort(arr, low, high):
    if low < high:
        pi = partition(arr, low, high)
        quickSort(arr, low, pi - 1)
        quickSort(arr, pi + 1, high)

function partition(arr, low, high):
    pivot = arr[high]
    i = low - 1
    for j = low to high - 1:
        if arr[j] < pivot:
            i++
            swap arr[i] with arr[j]
    swap arr[i + 1] with arr[high]
    return i + 1
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Step-by-step Example (Input: [10, 7, 8, 9, 1, 5]):",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SelectableText('''
Initial Array: [10, 7, 8, 9, 1, 5]
Pivot: 5 → Partition → [1, 5, 10, 7, 8, 9]
Recursive Sort on [1] and [10, 7, 8, 9]
Final Sorted: [1, 5, 7, 8, 9, 10]
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)),
                  const SizedBox(height: 24),
                  const Text(
                    "Code Snippets:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
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
                    "Worst Case: O(n²) (if pivot is always smallest or largest)",
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Space Complexity:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text("O(log n) auxiliary space (due to recursion)"),
                  const SizedBox(height: 24),
                  const Text(
                    "Advantages & Disadvantages:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
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
                            child: Text(
                              'Faster in practice than other O(n log n) algorithms',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Unstable and worst-case is O(n²)'),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'In-place, requires little extra memory',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Not stable (order of equal elements may change)',
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
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: Colors.redAccent,
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
