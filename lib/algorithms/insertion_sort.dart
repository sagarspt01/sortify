Future<int> insertionSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;

  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
      swaps++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(Duration(milliseconds: 300));
    }
    arr[j + 1] = key;
    steps.add(List.from(arr));
    notify();
    await Future.delayed(Duration(milliseconds: 300));
  }

  return swaps;
}
