import 'package:mobx/mobx.dart';

part 'sorting_form.g.dart';

enum SortingType { bubble, merge, insert, selection, none }

class SortingForm extends _SortingForm with _$SortingForm {
  SortingForm();
}

abstract class _SortingForm with Store {
  @observable
  SortingType? _sortingType;

  @computed
  SortingType? get sortingType => _sortingType;

  @observable
  int? _thresholdTime;

  @computed
  int? get thresholdTime => _thresholdTime;

  @observable
  int? _totalItem;

  @computed
  int? get totalItem => _totalItem;

  @observable
  bool _isRunning = false;

  @computed
  bool get isRunning => _isRunning;

  @computed
  bool get isDisableActionForm =>
      thresholdTime == null ||
      totalItem == null ||
      sortingType == null ||
      isRunning;

  @action
  void setTotalItem(int totalItem) {
    _totalItem = totalItem;
  }

  @action
  void setThresholdTime(int time) {
    _thresholdTime = time;
  }

  @action
  void onSetSorting(SortingType sortingType) {
    _sortingType = sortingType;
  }

  @action
  void stop() {
    _isRunning = false;
  }

  @action
  void run() {
    _isRunning = true;
  }
}
