import 'package:algovisualizer/domain/usecase/brute_force_usecase.dart';

abstract class DivideAndConquerUseCase implements BruteForceUseCase {
  void setDefaultItems(List<int> items);

  List<int> get values;
}
