import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:algovisualizer/domain/usecase/sorting_usecase.dart';

class SelectionSortUsecase implements SortingUseCase {
  final ReactiveRepository<Visualizer> reactiveRepository;

  SelectionSortUsecase(this.reactiveRepository);

  @override
  List<int> sorting(List<int> items) {
    for (int indexY = 0; indexY < items.length; indexY++) {
      int value = items[indexY];
      int indexSmall = indexY;

      for (int indexZ = indexY + 1; indexZ < items.length; indexZ++) {
        final colors = {items[indexZ].toDouble(), items[indexY].toDouble()};
        final indexColors = Set.of(colors);
        final int valueIndexZ = items[indexZ];
        final newListItems = List.of(items,growable: false);
        if (valueIndexZ < value) {
          value = valueIndexZ;
          indexSmall = indexZ;
        }
        reactiveRepository.onSetEvent(
            Visualizer(items: newListItems, indexActiveColor: indexColors));
      }
      int temp = items[indexY];
      items[indexY] = value;
      items[indexSmall] = temp;
      reactiveRepository
          .onSetEvent(Visualizer(items: List.of(items), indexActiveColor: {}));
    }
    reactiveRepository
        .onSetEvent(Visualizer(items: List.of(items), indexActiveColor: null));
    return items;
  }
}
