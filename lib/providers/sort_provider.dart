import 'dart:async';
import 'package:flutter/material.dart';
import '../algorithms/bubble_sort.dart';
import '../algorithms/quick_sort.dart';
import '../algorithms/merge_sort.dart';
import '../algorithms/insertion_sort.dart';
import '../algorithms/selection_sort.dart';
import '../algorithms/radix_sort.dart';
import '../algorithms/heap_sort.dart';

enum SortType { bubble, quick, merge, insertion, selection, radix, heap }

class SortProvider extends ChangeNotifier {
  List<int> _original = [];
  List<List<int>> _steps = [];
  int _currentStep = 0;
  bool _isSorting = false;
  int _swapCount = 0;
  String _summary = "";
  SortType _currentType = SortType.bubble;
  bool _popupShown = false;

  // Getters
  List<int> get current => _steps.isNotEmpty ? _steps[_currentStep] : [];
  bool get isSorting => _isSorting;
  String get summary => _summary;
  SortType get currentType => _currentType;
  int get currentStep => _currentStep;
  bool get popupShown => _popupShown;
  int get totalSteps => _steps.length;

  // Setters
  void setPopupShown(bool shown) {
    _popupShown = shown;
    notifyListeners();
  }

  void setSortType(SortType type) {
    _currentType = type;
    notifyListeners();
  }

  void setInput(List<int> input) {
    _original = [...input];
    _steps = [_original];
    _currentStep = 0;
    _summary = "";
    _swapCount = 0;
    _popupShown = false;
    notifyListeners();
  }

  Future<void> sort() async {
    if (_original.isEmpty || _isSorting) return;

    _isSorting = true;
    notifyListeners();

    _steps = [_original];
    _currentStep = 0;

    final stopwatch = Stopwatch()..start();

    switch (_currentType) {
      case SortType.bubble:
        _swapCount = await bubbleSort(_steps, notifyListeners);
        break;
      case SortType.quick:
        _swapCount = await quickSort(_steps, notifyListeners);
        break;
      case SortType.merge:
        _swapCount = await mergeSort(_steps, notifyListeners);
        break;
      case SortType.insertion:
        _swapCount = await insertionSort(_steps, notifyListeners);
        break;
      case SortType.selection:
        _swapCount = await selectionSort(_steps, notifyListeners);
        break;
      case SortType.radix:
        _swapCount = await radixSort(_steps, notifyListeners);
        break;
      case SortType.heap:
        _swapCount = await heapSort(_steps, notifyListeners);
        break;
    }

    stopwatch.stop();
    // await showGraphSteps();
    // await Future.delayed(const Duration(seconds: 1));

    _summary =
        """
 Input: ${_original.join(', ')}
 Sorted using: ${_currentType.name.toUpperCase()} Sort
 Time Complexity: ${_getTimeComplexity(_currentType)}
 Swaps: $_swapCount
 Time Taken: ${stopwatch.elapsed.inMilliseconds} ms
""";

    _isSorting = false;
    notifyListeners();
  }

  Future<void> showGraphSteps() async {
    for (int i = 1; i < _steps.length; i++) {
      _currentStep = i;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  void nextStep() {
    if (_currentStep < _steps.length - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void clearSummary() {
    _summary = "";
    _popupShown = false;
    notifyListeners();
  }

  String getAlgoDetails() {
    switch (_currentType) {
      case SortType.bubble:
        return "Bubble Sort compares adjacent elements and swaps them if needed. Time Complexity: O(n²).";
      case SortType.quick:
        return "Quick Sort uses divide-and-conquer and recursively sorts partitions. Avg Time: O(n log n).";
      case SortType.merge:
        return "Merge Sort divides the array and merges sorted halves. Time Complexity: O(n log n).";
      case SortType.insertion:
        return "Insertion Sort builds the sorted list one item at a time. Time Complexity: O(n²).";
      case SortType.selection:
        return "Selection Sort finds the minimum and places it in the correct position. Time Complexity: O(n²).";
      case SortType.radix:
        return "Radix Sort processes digits from LSB to MSB. Efficient for integers. Time Complexity: O(nk).";
      case SortType.heap:
        return "Heap Sort builds a max-heap and extracts max repeatedly. Time Complexity: O(n log n).";
    }
  }

  String _getTimeComplexity(SortType type) {
    switch (type) {
      case SortType.bubble:
      case SortType.insertion:
      case SortType.selection:
        return "O(n²)";
      case SortType.quick:
      case SortType.merge:
      case SortType.heap:
        return "O(n log n)";
      case SortType.radix:
        return "O(nk)";
    }
  }
}
