import '../../data/repository/reactive_repository.dart';
import '../entity/visualizer.dart';
import 'brute_force_usecase.dart';

class BubbleSortUseCase implements BruteForceUseCase {
  final ReactiveRepository<Visualizer> reactiveRepository;

  BubbleSortUseCase(this.reactiveRepository);

  @override
  List<int> sorting(List<int> items) {
    bool isNeedSwap = true;
    while (isNeedSwap) {
      bool isHaveSwap = false;
      for (int index = 0; index < items.length - 1; index++) {
        if (items[index] > items[index + 1]) {
          final int temp = items[index];
          items[index] = items[index + 1];
          items[index + 1] = temp;
          isHaveSwap = true;
          reactiveRepository.onSetEvent(Visualizer(
            items: List<int>.of(items, growable: false),
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
    return items;
  }
}
