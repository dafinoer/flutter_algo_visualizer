import 'package:algovisualizer/data/repository/reactive_repository.dart';

import '../entity/visualizer.dart';
import 'sorting_usecase.dart';

class MergeSortUseCase implements DivideAndConquer {
  final ReactiveRepository<Visualizer> reactiveRepository;
  List<int>? _items;
  Map<int, int>? _pointingValue;

  MergeSortUseCase(this.reactiveRepository);

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
    int leftIndex = 0;
    int rightIndex = 0;
    while (leftIndex < left.length && rightIndex < right.length) {
      _onSetEvent({left[leftIndex].toDouble(), right[rightIndex].toDouble()});
      if (left[leftIndex] < right[rightIndex]) {
        items.add(left[leftIndex]);
        leftIndex++;
      } else {
        _onSwitchItem(left[leftIndex], right[rightIndex]);
        items.add(right[rightIndex]);
        _onSetEvent({left[leftIndex].toDouble(), right[rightIndex].toDouble()});
        rightIndex++;
      }
    }
    if (leftIndex < left.length) {
      items.addAll(left.getRange(leftIndex, left.length));
    } else if (rightIndex < right.length) {
      items.addAll(right.getRange(rightIndex, right.length));
    }
    final isFullSort = items.length == values.length;
    final listValues = _items;
    if (isFullSort && listValues != null) {
      for (int index = 0; index < items.length; index++) {
        listValues[index] = items[index];
        _onSetEvent({items[index].toDouble()});
      }
      _onSetEvent(null);
    }
    return items;
  }

  @override
  List<int> get values =>
      _items?.toList(growable: false) ?? List.empty(growable: false);

  @override
  void setDefaultItems(List<int> items) {
    _items = items;
    _createNewPointingMap(items);
  }

  void _onSetEvent(Set<double>? indexEnableColor) {
    reactiveRepository.onSetEvent(
        Visualizer(items: List.of(values), indexActiveColor: indexEnableColor));
  }

  void _onSwitchItem(int leftValue, int rightValue) {
    final pointValue = _pointingValue;
    final items = _items;
    if (pointValue != null && items != null && items.isNotEmpty) {
      final resultIndexLeft = pointValue[leftValue];
      final resultIndexRight = pointValue[rightValue];
      if (resultIndexLeft != null && resultIndexRight != null) {
        final tempRight = items[resultIndexRight];
        items[resultIndexRight] = items[resultIndexLeft];
        items[resultIndexLeft] = tempRight;
        pointValue.update(leftValue, (value) => resultIndexRight);
        pointValue.update(rightValue, (value) => resultIndexLeft);
      }
    }
  }

  void _createNewPointingMap(List<int> items) {
    int index = 0;
    _pointingValue = Map<int, int>.of({});
    for (final item in items) {
      _pointingValue!.putIfAbsent(item, () => index);
      index++;
    }
  }
}
