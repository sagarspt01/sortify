import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  final int value;
  final double maxHeight;
  final double barWidth;

  const BarWidget({
    super.key,
    required this.value,
    required this.maxHeight,
    required this.barWidth,
  });

  Color _getColor(int value) {
    return Colors.primaries[value % Colors.primaries.length];
  }

  @override
  Widget build(BuildContext context) {
    final height = (value / 100.0 * maxHeight).clamp(20.0, maxHeight);

    return Container(
      width: barWidth,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      decoration: BoxDecoration(
        color: _getColor(value),
        borderRadius: BorderRadius.circular(3.0),
      ),
      alignment: Alignment.bottomCenter,
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: barWidth * 0.4 > 12 ? 12 : barWidth * 0.4,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
