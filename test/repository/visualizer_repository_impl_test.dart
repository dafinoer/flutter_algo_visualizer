import 'package:algovisualizer/data/data_source/local_data_source.dart';
import 'package:algovisualizer/domain/entity/algoritm_model.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';
import 'package:algovisualizer/domain/repository/visualizer_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'visualizer_repository_impl_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<LocalDataSource>(onMissingStub: OnMissingStub.throwException),
  ],
)
void main() {
  group('Visualizer Repository Impl Test', () {
    late MockLocalDataSource mockLocalDataSource;
    late VisualizerRepositoryImpl visualizerRepositoryImpl;
    setUp(() {
      mockLocalDataSource = MockLocalDataSource();
      visualizerRepositoryImpl = VisualizerRepositoryImpl(mockLocalDataSource);
    });

    test('Get visualizer data', () {
      when(mockLocalDataSource.generatedUnSortData(10))
          .thenReturn(const Visualizer(items: [1, 2, 3]));
      final result = visualizerRepositoryImpl.getVisualizerData(10);
      expect(result.items, [1, 2, 3]);
    });

    test('Get Visualizer Desc', () {
      when(mockLocalDataSource.getDataAlgorithmVisualizer(any)).thenReturn(
        const AlgorithmModel(title: 'Halo', bigNotationDetail: 'Lorem'),
      );
      final result = visualizerRepositoryImpl.getVisualizerDescription('hehe');
      expect(result?.title, 'Halo');
      expect(result?.bigNotationDetail, 'Lorem');
    });

    test(
      'Visualizer Null',
      () {
        when(mockLocalDataSource
                .getDataAlgorithmVisualizer(argThat(equals('binary'))))
            .thenReturn(null);
        final result =
            visualizerRepositoryImpl.getVisualizerDescription('binary');
        expect(result, null);
        verify(mockLocalDataSource.getDataAlgorithmVisualizer('binary'))
            .called(1);
      },
    );

    tearDown(() {
      resetMockitoState();
    });
  });
}
