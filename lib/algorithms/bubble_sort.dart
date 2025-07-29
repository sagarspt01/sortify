Future<int> bubbleSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;

  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int tmp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = tmp;
        swaps++;
        steps.add(List.from(arr));
        notify();
        await Future.delayed(Duration(milliseconds: 300));
      }
    }
  }

  return swaps;
}
