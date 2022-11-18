import 'package:algovisualizer/data/repository/reactive_repository.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:algovisualizer/domain/usecase/bubble_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/insert_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/merge_sort_usecase.dart';
import 'package:algovisualizer/domain/usecase/selection_sort_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
      late MergeSortUseCase mergeSortUseCase;

      final unsortList = [1, 20, 3, 90, 80, 20];

      setUp(() {
        mockReactiveRepository = MockReactiveRepository();
        bubbleSortUseCase = BubbleSortUseCase(mockReactiveRepository);
        selectionSortUsecase = SelectionSortUsecase(mockReactiveRepository);
        insertSortUsecase = InsertSortUsecase(mockReactiveRepository);
        mergeSortUseCase = MergeSortUseCase(mockReactiveRepository);
        mergeSortUseCase.setDefaultItems(unsortList);
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

      test('Merge Sort output test', () {
        final testList = [30, 1, 10, 2, 0, 3, 80, 5];
        mergeSortUseCase.setDefaultItems(testList);
        final result = mergeSortUseCase.sorting(testList);
        expect(result, [0, 1, 2, 3, 5, 10, 30, 80]);
      });

      tearDownAll(() {
        resetMockitoState();
      });
    },
  );
}
