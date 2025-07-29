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
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F0C29),
                  Color(0xFF302B63),
                  Color(0xFF24243e),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.purpleAccent,
              unselectedLabelColor: Colors.white60,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.purpleAccent),
                insets: EdgeInsets.symmetric(horizontal: 16),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              tabs: codeMap.keys.map((lang) {
                return Tab(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(lang),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: screenHeight * 0.4,
            width: screenWidth * 0.95,
            child: TabBarView(
              children: codeMap.entries.map((entry) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent.withOpacity(0.4),
                            blurRadius: 16,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SelectableText(
                            entry.value,
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: Colors.white,
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
                        color: Colors.white70,
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: entry.value));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${entry.key} code copied!'),
                              backgroundColor: Colors.purpleAccent.shade200,
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
