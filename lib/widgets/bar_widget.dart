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

  Color _getBarColor(int value) {
    final baseColors = [
      Colors.purpleAccent.shade200,
      Colors.cyanAccent.shade400,
      Colors.amberAccent.shade200,
      Colors.blueAccent.shade200,
      Colors.pinkAccent.shade100,
      Colors.deepPurpleAccent.shade100,
    ];
    return baseColors[value % baseColors.length];
  }

  @override
  Widget build(BuildContext context) {
    final height = (value / 100.0 * maxHeight).clamp(20.0, maxHeight);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: barWidth,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getBarColor(value).withOpacity(0.9),
            _getBarColor(value).withOpacity(0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: _getBarColor(value).withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
            spreadRadius: 1,
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: barWidth * 0.4 > 12 ? 12 : barWidth * 0.4,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: const [Shadow(color: Colors.black, blurRadius: 4)],
        ),
      ),
    );
  }
}
