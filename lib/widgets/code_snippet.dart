import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeSnippetTab extends StatelessWidget {
  final Map<String, String> codeMap;

  const CodeSnippetTab({super.key, required this.codeMap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: codeMap.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: codeMap.keys.map((lang) => Tab(text: lang)).toList(),
          ),
          SizedBox(
            height: screenHeight * 0.4, // 40% of screen height
            width: screenWidth * 0.95, // 95% of screen width
            child: TabBarView(
              children: codeMap.entries.map((entry) {
                final scrollController = ScrollController(); // ✅ Add controller

                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Scrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          child: SelectableText(
                            entry.value,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        tooltip: 'Copy code',
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: entry.value));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${entry.key} code copied!'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
