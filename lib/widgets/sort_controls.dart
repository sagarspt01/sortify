import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sort_provider.dart';

class SortControls extends StatefulWidget {
  const SortControls({super.key});

  @override
  State<SortControls> createState() => _SortControlsState();
}

class _SortControlsState extends State<SortControls> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool _showAlgorithms = true;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() => _showAlgorithms = false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Input Error",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SortProvider>(context);
    final isSorting = provider.isSorting;
    final sortTypes = SortType.values;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // Check if it's web/tablet

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F0C29), Color(0xFF302B63)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Input field - constrain width on web
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWideScreen ? 500 : double.infinity,
            ),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              enabled: !isSorting,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter numbers (e.g., 5, 8, 3)',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.pinkAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white70),
                  onPressed: () => controller.clear(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Toggle algorithm selection
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (focusNode.hasFocus) {
                  FocusScope.of(context).unfocus();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (mounted) setState(() => _showAlgorithms = true);
                  });
                } else {
                  setState(() => _showAlgorithms = !_showAlgorithms);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _showAlgorithms ? Icons.expand_less : Icons.expand_more,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _showAlgorithms ? "Hide Algorithms" : "Choose Algorithm",
                    style: const TextStyle(
                      color: Color(0xFFE91E63),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Algorithm Chips with improved responsiveness
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _showAlgorithms
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final availableWidth = constraints.maxWidth;
                  // Better chip width calculation for web
                  final chipWidth = isWideScreen
                      ? ((availableWidth - 48) / 4).clamp(
                          100.0,
                          150.0,
                        ) // 4 chips per row on web
                      : ((availableWidth - 24) / 3).clamp(
                          80.0,
                          double.infinity,
                        ); // 3 chips per row on mobile

                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: sortTypes.map((type) {
                      final isSelected = provider.currentType == type;
                      return SizedBox(
                        width: chipWidth,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: isSorting
                                ? null
                                : () => provider.setSortType(type),
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  type.name.toUpperCase(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),

          const SizedBox(height: 12),

          // Buttons Row - always in a single row
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWideScreen ? 500 : double.infinity,
            ),
            child: Row(
              children: [
                _buildAnimatedButton(
                  label: "Show Graph",
                  color: Colors.blueAccent,
                  onPressed: isSorting ? null : _handleShowGraph,
                ),
                const SizedBox(width: 16), // Proper spacing between buttons
                _buildAnimatedButton(
                  label: "Sort",
                  color: Colors.pinkAccent,
                  onPressed: isSorting ? null : _handleSort,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleShowGraph() {
    final input = controller.text;
    final values = input
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>()
        .toList();

    final provider = Provider.of<SortProvider>(context, listen: false);

    if (input.trim().isEmpty || values.isEmpty) {
      // Clear the existing graph and show the placeholder message
      provider.setInput([]);
      FocusScope.of(context).requestFocus(focusNode);
      _showError("Please enter valid numbers.");
      return;
    }

    provider.setInput(values);
  }

  void _handleSort() {
    final input = controller.text;
    final values = input
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>()
        .toList();

    final provider = Provider.of<SortProvider>(context, listen: false);

    if (input.trim().isEmpty || values.isEmpty) {
      // Clear the existing graph and show the placeholder message
      provider.setInput([]);
      FocusScope.of(context).requestFocus(focusNode);
      _showError("Please enter valid numbers.");
      return;
    }

    if (provider.currentType == null) {
      _showError("Please select a sorting algorithm.");
      return;
    }

    provider.setInput(values);
    provider.sort();
  }

  Widget _buildAnimatedButton({
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return Expanded(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: onPressed == null ? 1.0 : 1.02),
        duration: const Duration(milliseconds: 300),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal:
                      8, // Reduced horizontal padding to prevent overflow
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                minimumSize: const Size(100, 48), // Minimum button size
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
