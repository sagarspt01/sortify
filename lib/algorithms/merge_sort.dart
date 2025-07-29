import 'dart:async';

Future<int> mergeSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int writes = 0;
  final delay = Duration(milliseconds: 300);

  Future<void> _merge(int l, int m, int r) async {
    List<int> left = arr.sublist(l, m + 1);
    List<int> right = arr.sublist(m + 1, r + 1);
    int i = 0, j = 0, k = l;

    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        arr[k++] = left[i++];
      } else {
        arr[k++] = right[j++];
      }
      writes++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(delay);
    }

    while (i < left.length) {
      arr[k++] = left[i++];
      writes++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(delay);
    }

    while (j < right.length) {
      arr[k++] = right[j++];
      writes++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(delay);
    }
  }

  Future<void> _ms(int l, int r) async {
    if (l < r) {
      int m = (l + r) ~/ 2;
      await _ms(l, m);
      await _ms(m + 1, r);
      await _merge(l, m, r);
    }
  }

  await _ms(0, arr.length - 1);
  return writes;
}
