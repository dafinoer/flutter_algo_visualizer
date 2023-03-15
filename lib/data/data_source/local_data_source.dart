import 'dart:math';

import '../../components/algo_desc.dart';
import '../../domain/entity/algoritm_model.dart';
import '../../domain/entity/visualizer.dart';

class LocalDataSource {
  const LocalDataSource();

  AlgorithmModel? getDataAlgorithmVisualizer(String keyName) {
    const Map<String, dynamic> algoritmsData = algoDesc;
    final algoritm = algoritmsData[keyName];
    if (algoritm == null) return null;

    return algoritm;
  }

  Visualizer generatedUnSortData(int maxItem) {
    final Set<int> items = {};
    final random = Random();
    for (int index = 0; index < maxItem; index++) {
      items.add(random.nextInt(maxItem) + 1);
    }
    final visualizer = Visualizer(items: items.toList(growable: false));
    return visualizer;
  }
}
