import 'dart:math';

import '../../domain/entity/algoritm_model.dart';
import '../../domain/entity/visualizer.dart';

class LocalDataSource {
  const LocalDataSource();

  AlgorithmModel getDataAlgorithmVisualizer(String keyName) {
    final algoritmsData = getAllData();
    final algoritm = getAllData()[keyName];
    if (!algoritmsData.containsKey(keyName) || algoritm == null) {
      throw ArgumentError('key $keyName data not found');
    }
    return algoritm;
  }

  Map<String, AlgorithmModel> getAllData() {
    return const <String, AlgorithmModel>{
      'binary-search': AlgorithmModel(
        title: 'Binary Search Tree',
        bigNotationDetail: 'log(n log m)',
      ),
    };
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
