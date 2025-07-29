Future<int> heapSort(List<List<int>> steps, void Function() notify) async {
  List<int> arr = List.from(steps.last);
  int swaps = 0;

  int n = arr.length;

  Future<void> heapify(int n, int i) async {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;

    if (largest != i) {
      int temp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = temp;
      swaps++;
      steps.add(List.from(arr));
      notify();
      await Future.delayed(Duration(milliseconds: 300));
      await heapify(n, largest);
    }
  }

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    await heapify(n, i);
  }

  for (int i = n - 1; i >= 0; i--) {
    int temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;
    swaps++;
    steps.add(List.from(arr));
    notify();
    await Future.delayed(Duration(milliseconds: 300));
    await heapify(i, 0);
  }

  return swaps;
}
