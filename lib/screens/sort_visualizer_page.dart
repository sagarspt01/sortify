import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sortify/algorithms_tuts_and_about/about_page.dart';
import 'package:sortify/algorithms_tuts_and_about/bubble_sort_info.dart';
import '../providers/sort_provider.dart';
import '../widgets/bar_widget.dart';
import '../widgets/sort_controls.dart';

class SortVisualizerPage extends StatelessWidget {
  const SortVisualizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SortProvider>(
      builder: (context, provider, _) {
        final values = provider.current;
        final screenWidth = MediaQuery.of(context).size.width;
        final maxBarHeight = MediaQuery.of(context).size.height * 0.4;
        final barCount = values.length;
        final barWidth = barCount > 0 ? (screenWidth / barCount) * 0.9 : 20;

        // Show popup after animation completes
        if (!provider.popupShown && provider.summary.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await Future.delayed(const Duration(seconds: 2));
            if (!provider.popupShown) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    '${provider.currentType.name.toUpperCase()} Sort Completed',
                  ),
                  content: Text(provider.summary),
                  actions: [
                    TextButton(
                      onPressed: () {
                        provider.setPopupShown(true);
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Sorting Visualizer"),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Text(
                    'SORTIFY',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.bubble_chart),
                  title: const Text('Bubble Sort Info'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BubbleSortInfoPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutPage()),
                    );
                  },
                ),
                // Add others similarly
              ],
            ),
          ),

          body: SafeArea(
            child: Column(
              children: [
                // GRAPH DISPLAY
                Expanded(
                  child: Center(
                    child: values.isEmpty
                        ? const Text("Enter input and press 'Show Graph'")
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: values
                                    .map(
                                      (val) => BarWidget(
                                        key: ValueKey(val),
                                        value: val,
                                        maxHeight: maxBarHeight,
                                        barWidth: barWidth.toDouble(),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                  ),
                ),

                // STEP NAVIGATION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: provider.prevStep,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      '${provider.currentStep + 1} / ${provider.totalSteps}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: provider.nextStep,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),

                // INPUTS + BUTTONS
                const SortControls(),
              ],
            ),
          ),
        );
      },
    );
  }
}
