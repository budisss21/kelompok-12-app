class SortingAlgorithms {
  // Bubble Sort
  static List<int> bubbleSort(List<int> list, {bool ascending = true}) {
    List<int> arr = List.from(list);
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        bool condition = ascending ? arr[j] > arr[j + 1] : arr[j] < arr[j + 1];
        if (condition) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
    return arr;
  }

  // Selection Sort
  static List<int> selectionSort(List<int> list, {bool ascending = true}) {
    List<int> arr = List.from(list);
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      int minMaxIdx = i;
      for (int j = i + 1; j < n; j++) {
        bool condition = ascending ? arr[j] < arr[minMaxIdx] : arr[j] > arr[minMaxIdx];
        if (condition) {
          minMaxIdx = j;
        }
      }
      int temp = arr[minMaxIdx];
      arr[minMaxIdx] = arr[i];
      arr[i] = temp;
    }
    return arr;
  }

  // Insertion Sort
  static List<int> insertionSort(List<int> list, {bool ascending = true}) {
    List<int> arr = List.from(list);
    int n = arr.length;
    for (int i = 1; i < n; i++) {
      int key = arr[i];
      int j = i - 1;
      while (j >= 0 && (ascending ? arr[j] > key : arr[j] < key)) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = key;
    }
    return arr;
  }

  // Merge Sort
  static List<int> mergeSort(List<int> list, {bool ascending = true}) {
    if (list.length <= 1) return list;
    int mid = list.length ~/ 2;
    List<int> left = mergeSort(list.sublist(0, mid), ascending: ascending);
    List<int> right = mergeSort(list.sublist(mid), ascending: ascending);
    return _merge(left, right, ascending);
  }

  static List<int> _merge(List<int> left, List<int> right, bool ascending) {
    List<int> result = [];
    int i = 0, j = 0;
    while (i < left.length && j < right.length) {
      bool condition = ascending ? left[i] <= right[j] : left[i] >= right[j];
      if (condition) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }
    result.addAll(left.sublist(i));
    result.addAll(right.sublist(j));
    return result;
  }

  // Quick Sort
  static List<int> quickSort(List<int> list, {bool ascending = true}) {
    if (list.length <= 1) return list;
    int pivot = list[list.length ~/ 2];
    List<int> less = [];
    List<int> equal = [];
    List<int> greater = [];
    for (int x in list) {
      if (ascending) {
        if (x < pivot) less.add(x);
        else if (x == pivot) equal.add(x);
        else greater.add(x);
      } else {
        if (x > pivot) less.add(x);
        else if (x == pivot) equal.add(x);
        else greater.add(x);
      }
    }
    return quickSort(less, ascending: ascending) + equal + quickSort(greater, ascending: ascending);
  }
}
