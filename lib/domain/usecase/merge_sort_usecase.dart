import 'package:algovisualizer/data/repository/reactive_repository.dart';

import '../entity/visualizer.dart';
import 'sorting_usecase.dart';

class MergeSortUseCase implements DivideAndConquer {
  final ReactiveRepository<Visualizer> reactiveRepository;
  late List<int> _items;

  MergeSortUseCase(this.reactiveRepository) {
    _items = List.empty(growable: true);
  }

  @override
  List<int> sorting(List<int> items) {
    if (items.length < 2) return items;

    final totalLength = items.length;
    final middleNumber = totalLength / 2;
    final middleNumberToRound = middleNumber.round();
    final itemsA = items.getRange(0, middleNumberToRound).toList();
    final itemsB = items.getRange(middleNumberToRound, totalLength).toList();

    return merge(sorting(itemsA), sorting(itemsB));
  }

  List<int> merge(List<int> left, List<int> right) {
    final items = <int>[];
    final valueAddList = <int>{};
    int leftIndex = 0;
    int rightIndex = 0;
    while (leftIndex < left.length && rightIndex < right.length) {
      reactiveRepository.onSetEvent(Visualizer(
        items: List.of(_items),
        indexActiveColor: <double>{
          left[leftIndex].toDouble(),
          right[rightIndex].toDouble()
        },
      ));
      if (left[leftIndex] < right[rightIndex]) {
        items.add(left[leftIndex]);
        valueAddList.add(left[leftIndex]);
        leftIndex++;
      } else {
        items.add(right[rightIndex]);
        valueAddList.add(right[rightIndex]);
        rightIndex++;
      }
    }
    if (left.isNotEmpty) {
      items.addAll(left.where((e) => !valueAddList.contains(e)).toList());
    }
    if (right.isNotEmpty) {
      items.addAll(right.where((e) => !valueAddList.contains(e)).toList());
    }
    final isFullSort = items.length == _items.length;
    for (int index = 0; index < items.length; index++) {
      _items[index] = items[index];
    }
    reactiveRepository.onSetEvent(Visualizer(
      items: List.of(_items),
      indexActiveColor: !isFullSort ? <double>{} : null,
    ));
    return items;
  }

  @override
  List<int> get values => _items.toList(growable: false);

  @override
  void setDefaultItems(List<int> items) {
    _items = items;
  }
}
