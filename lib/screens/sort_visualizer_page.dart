import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:sortify/algorithms_tuts_and_about/heap_sort_info.dart';
import 'package:sortify/algorithms_tuts_and_about/merge_sort_info.dart';
import 'package:sortify/algorithms_tuts_and_about/quick_sort_info.dart';
import 'package:sortify/algorithms_tuts_and_about/radix_sort_info.dart';
import 'package:sortify/algorithms_tuts_and_about/selection_sort_info.dart';

import '../providers/sort_provider.dart';
import '../widgets/bar_widget.dart';
import '../widgets/sort_controls.dart';
import '../algorithms_tuts_and_about/bubble_sort_info.dart';
import '../algorithms_tuts_and_about/about_page.dart';

class SortVisualizerPage extends StatefulWidget {
  const SortVisualizerPage({super.key});

  @override
  State<SortVisualizerPage> createState() => _SortVisualizerPageState();
}

class _SortVisualizerPageState extends State<SortVisualizerPage> {
  late List<ScreenHiddenDrawer> pages;

  @override
  void initState() {
    super.initState();
    // Remove 'final' and assign to the instance variable 'pages'
    pages = [
      // Top: Visualizer Page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Sort_Visualizer',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.cyanAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const VisualizerContent(),
      ),

      // Bubble Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Bubble Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const BubbleSortInfoPage(),
      ),

      // Heap Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Heap Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const HeapSortInfoPage(),
      ),

      // Merge Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Merge Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const MergeSortInfoPage(),
      ),

      // Quick Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Quick Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const QuickSortInfoPage(),
      ),

      // Radix Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Radix Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const RadixSortInfoPage(),
      ),
      // Selection Sort Info
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Selection Sort Info',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.amberAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.amberAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const SelectionSortInfoPage(),
      ),
      // Bottom: About Page
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'About',
          baseStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          selectedStyle: const TextStyle(
            color: Colors.pinkAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.pinkAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        const AboutPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color(0xFF0F0C29),
      backgroundColorAppBar: Color(0xFF0F0C29),
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 60,
      contentCornerRadius: 20,
      elevationAppBar: 4,
      withAutoTittleName: true,
      styleAutoTittleName: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class VisualizerContent extends StatelessWidget {
  const VisualizerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SortProvider>(
      builder: (context, provider, _) {
        final values = provider.current;
        final screenWidth = MediaQuery.of(context).size.width;
        final maxBarHeight = MediaQuery.of(context).size.height * 0.4;
        final barCount = values.length;
        final barWidth = barCount > 0 ? (screenWidth / barCount) * 0.9 : 20;

        if (!provider.popupShown && provider.summary.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Future.delayed(const Duration(seconds: 1));
            if (context.mounted && !provider.popupShown) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: Colors.grey.shade900,
                  title: Text(
                    '${provider.currentType.name.toUpperCase()} Sort Completed',
                    style: const TextStyle(color: Colors.purpleAccent),
                  ),
                  content: Text(
                    provider.summary,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        provider.setPopupShown(true);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.purpleAccent),
                      ),
                    ),
                  ],
                ),
              );
            }
          });
        }

        return Scaffold(
          backgroundColor: const Color(0xFF24243e),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: values.isEmpty
                        ? const Text(
                            "Enter input and press 'Show Graph'",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ).animate().fadeIn(duration: 500.ms)
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: values.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final value = entry.value;
                                  return BarWidget(
                                    key: ValueKey('bar_${index}_$value'),
                                    value: value,
                                    maxHeight: maxBarHeight,
                                    barWidth: barWidth.toDouble(),
                                  );
                                }).toList(),
                              ),
                            ).animate().fadeIn(duration: 800.ms),
                          ),
                  ),
                ),
                if (values.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: provider.prevStep,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        Text(
                          '${provider.currentStep + 1} / ${provider.totalSteps}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: provider.nextStep,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 300.ms),
                  ),
                const SortControls(),
              ],
            ),
          ),
        );
      },
    );
  }
}
