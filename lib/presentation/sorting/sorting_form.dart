import 'package:mobx/mobx.dart';

part 'sorting_form.g.dart';

enum SortingType { bubble, merge, insert, selection, none }

class SortingForm extends _SortingForm with _$SortingForm {
  SortingForm();
}

abstract class _SortingForm with Store {
  @observable
  SortingType? _sortingType;

  @observable
  int _thresHoleTime = 300;

  @observable
  int _totalMaxItem = 10;

  @observable
  bool _isDisableButton = false;

  @computed
  int get totalItem => _totalMaxItem;

  @computed
  int get thresHoleTime => _thresHoleTime;

  @computed
  SortingType? get sortingType => _sortingType;

  @computed
  bool get isDisableActionForm => _isDisableButton;

  @action
  void setTotalItem(int totalItem) {
    _totalMaxItem = totalItem;
  }

  @action
  void setThresHoleTime(int time) {
    _thresHoleTime = time;
  }

  @action
  void onSetSorting(SortingType sortingType) {
    _sortingType = sortingType;
  }

  @action
  void onDisableButton(bool isDisable) {
    _isDisableButton = isDisable;
  }
}
