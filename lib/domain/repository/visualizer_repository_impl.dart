import 'package:algovisualizer/data/data_source/local_data_source.dart';
import 'package:algovisualizer/data/repository/visual_repository.dart';
import 'package:algovisualizer/domain/entity/algoritm_model.dart';
import 'package:algovisualizer/domain/entity/visualizer.dart';

class VisualizerRepositoryImpl implements VisualizerRepository {
  final LocalDataSource localDataSource;

  VisualizerRepositoryImpl(this.localDataSource);

  @override
  AlgorithmModel getVisualizerDescription(String keyName) {
    final algorithm = localDataSource.getDataAlgorithmVisualizer(keyName);
    return algorithm;
  }

  @override
  Visualizer getVisualizerData(int maxItem) {
    final result = localDataSource.generatedUnSortData(maxItem);
    return result;
  }
}
