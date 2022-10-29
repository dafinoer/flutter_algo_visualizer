import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:algovisualizer/domain/usecase/bubble_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/insert_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/selection_sort_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'sorting_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ReactiveRepository<Visualizer>>(),
])
void main() {
  group(
    'Sorting Tes Group',
    () {
      late BubbleSortUseCase bubbleSortUseCase;
      late SelectionSortUsecase selectionSortUsecase;
      late InsertSortUsecase insertSortUsecase;
      late MockReactiveRepository mockReactiveRepository;
      final unsortList = [1, 20, 3];
      setUp(() {
        mockReactiveRepository = MockReactiveRepository();
        bubbleSortUseCase = BubbleSortUseCase(mockReactiveRepository);
        selectionSortUsecase = SelectionSortUsecase(mockReactiveRepository);
        insertSortUsecase = InsertSortUsecase(mockReactiveRepository);
      });
      test('Bubble Sort output test', () {
        final result = bubbleSortUseCase.sorting(unsortList);
        expect(result, [1, 3, 20]);
      });

      test('Selection Sort output test', () {
        final result = selectionSortUsecase.sorting(unsortList);
        expect(result, [1, 3, 20]);
      });

      test('Insertion Sort output test', () {
        final result = insertSortUsecase.sorting([30, 0, 20]);
        expect(result, [0, 20, 30]);
      });
    },
  );
}
