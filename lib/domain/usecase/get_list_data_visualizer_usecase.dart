import '../entity/visualizer.dart';
import '../repository/visualizer_repository_impl.dart';

class GetListDataVisualizerUseCase {
  final VisualizerRepositoryImpl repositoryImpl;

  GetListDataVisualizerUseCase(this.repositoryImpl);

  Visualizer getVisualizer(int maxItem) {
    final result = repositoryImpl.getVisualizerData(maxItem);
    return result;
  }
}
