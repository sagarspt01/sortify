Future<int> radixSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;

  int getMax(List<int> array) => array.reduce((a, b) => a > b ? a : b);

  Future<void> countingSort(int exp) async {
    List<int> output = List.filled(arr.length, 0);
    List<int> count = List.filled(10, 0);

    for (int i = 0; i < arr.length; i++) {
      count[(arr[i] ~/ exp) % 10]++;
    }

    for (int i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }

    for (int i = arr.length - 1; i >= 0; i--) {
      output[count[(arr[i] ~/ exp) % 10] - 1] = arr[i];
      count[(arr[i] ~/ exp) % 10]--;
    }

    for (int i = 0; i < arr.length; i++) {
      arr[i] = output[i];
      swaps++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(Duration(milliseconds: 300));
    }
  }

  for (int exp = 1; getMax(arr) ~/ exp > 0; exp *= 10) {
    await countingSort(exp);
  }

  return swaps;
}
