import 'package:algovisualizer/domain/entity/algoritm_model.dart';

import '../../domain/entity/visualizer.dart';

abstract class VisualizerRepository {
  AlgorithmModel? getVisualizerDescription(String keyName);

  Visualizer getVisualizerData(int maxItem);
}
