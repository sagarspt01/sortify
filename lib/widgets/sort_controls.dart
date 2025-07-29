import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sort_provider.dart';

class SortControls extends StatefulWidget {
  const SortControls({super.key});

  @override
  State<SortControls> createState() => _SortControlsState();
}

class _SortControlsState extends State<SortControls> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SortProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter numbers separated by commas (e.g. 5, 8, 3)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButton<SortType>(
                  isExpanded: true,
                  value: provider.currentType,
                  onChanged: (val) {
                    if (val != null) provider.setSortType(val);
                  },
                  items: SortType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.name.toUpperCase()),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final values = controller.text
                      .split(',')
                      .map((e) => int.tryParse(e.trim()))
                      .where((e) => e != null)
                      .map((e) => e!)
                      .toList();
                  provider.setInput(values);
                },
                child: const Text("Show Graph"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: provider.sort,
                child: const Text("Sort"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
