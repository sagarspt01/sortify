Future<int> selectionSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;

  for (int i = 0; i < arr.length - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    if (minIdx != i) {
      int temp = arr[i];
      arr[i] = arr[minIdx];
      arr[minIdx] = temp;
      swaps++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(Duration(milliseconds: 300));
    }
  }

  return swaps;
}
