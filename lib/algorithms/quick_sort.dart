import 'dart:async';

Future<int> quickSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;
  final delay = Duration(milliseconds: 300);

  Future<int> partition(int low, int high) async {
    int pivot = arr[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (arr[j] < pivot) {
        i++;
        if (i != j) {
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
          swaps++;
          steps.add(List.from(arr));
          notify();
          await Future.delayed(delay);
        }
      }
    }

    if (i + 1 != high) {
      int temp = arr[i + 1];
      arr[i + 1] = arr[high];
      arr[high] = temp;
      swaps++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(delay);
    }

    return i + 1;
  }

  Future<void> sort(int low, int high) async {
    if (low < high) {
      int pi = await partition(low, high);
      await sort(low, pi - 1);
      await sort(pi + 1, high);
    }
  }

  await sort(0, arr.length - 1);
  return swaps;
}
