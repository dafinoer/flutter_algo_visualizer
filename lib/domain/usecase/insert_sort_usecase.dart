import 'dart:math';

import '../../data/repository/reactive_repository.dart';
import '../entity/visualizer.dart';
import 'brute_force_usecase.dart';

class InsertSortUsecase implements BruteForceUseCase {
  final ReactiveRepository<Visualizer> reactiveRepository;

  InsertSortUsecase(this.reactiveRepository);

  @override
  List<int> sorting(List<int> items) {
    for (int indexY = 0; indexY < items.length - 1; indexY++) {
      final indexNow = indexY + 1;
      for (int indexZ = indexNow; indexZ > 0; indexZ--) {
        final currentValue = items[indexZ];
        final prevValue = items[max(0, indexZ - 1)];
        if (prevValue > currentValue) {
          items[indexZ] = prevValue;
          items[indexZ - 1] = currentValue;
          reactiveRepository.onSetEvent(Visualizer(
              items: List.of(items),
              indexActiveColor: {currentValue.toDouble()}));
        }
      }
    }
    reactiveRepository.onSetEvent(Visualizer(
      items: List.of(items),
      indexActiveColor: null,
    ));
    return items;
  }
}
