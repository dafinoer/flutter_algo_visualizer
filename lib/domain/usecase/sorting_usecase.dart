abstract class SortingUseCase {
  List<int> sorting(List<int> items);
}

abstract class DivideAndConquer implements SortingUseCase {
  void setDefaultItems(List<int> items);

  List<int> items();
}
