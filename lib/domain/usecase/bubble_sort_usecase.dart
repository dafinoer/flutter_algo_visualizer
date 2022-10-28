import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:algovisualizer/domain/usecase/sorting_usecase.dart';

class BubbleSortUseCase implements SortingUseCase {
  final ReactiveRepository<Visualizer> reactiveRepository;

  BubbleSortUseCase(this.reactiveRepository);

  @override
  void call(List<int> items) {
    bool isNeedSwap = true;
    while (isNeedSwap) {
      bool isHaveSwap = false;
      for (int index = 0; index < items.length - 1; index++) {
        if (items[index] > items[index + 1]) {
          int temp = items[index];
          items[index] = items[index + 1];
          items[index + 1] = temp;
          isHaveSwap = true;
          reactiveRepository.onSetEvent(Visualizer(
            items: List.of(items),
            indexActiveColor: {items[index + 1].toDouble()},
          ));
        }
      }
      isNeedSwap = isHaveSwap;
    }
    reactiveRepository.onSetEvent(Visualizer(
      items: items,
      indexActiveColor: null,
    ));
  }
}
