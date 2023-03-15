// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorting_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SortingForm on _SortingForm, Store {
  Computed<SortingType?>? _$sortingTypeComputed;

  @override
  SortingType? get sortingType =>
      (_$sortingTypeComputed ??= Computed<SortingType?>(() => super.sortingType,
              name: '_SortingForm.sortingType'))
          .value;
  Computed<int?>? _$thresholdTimeComputed;

  @override
  int? get thresholdTime =>
      (_$thresholdTimeComputed ??= Computed<int?>(() => super.thresholdTime,
              name: '_SortingForm.thresholdTime'))
          .value;
  Computed<int?>? _$totalItemComputed;

  @override
  int? get totalItem => (_$totalItemComputed ??=
          Computed<int?>(() => super.totalItem, name: '_SortingForm.totalItem'))
      .value;
  Computed<bool>? _$isRunningComputed;

  @override
  bool get isRunning => (_$isRunningComputed ??=
          Computed<bool>(() => super.isRunning, name: '_SortingForm.isRunning'))
      .value;
  Computed<bool>? _$isDisableActionFormComputed;

  @override
  bool get isDisableActionForm => (_$isDisableActionFormComputed ??=
          Computed<bool>(() => super.isDisableActionForm,
              name: '_SortingForm.isDisableActionForm'))
      .value;

  late final _$_sortingTypeAtom =
      Atom(name: '_SortingForm._sortingType', context: context);

  @override
  SortingType? get _sortingType {
    _$_sortingTypeAtom.reportRead();
    return super._sortingType;
  }

  @override
  set _sortingType(SortingType? value) {
    _$_sortingTypeAtom.reportWrite(value, super._sortingType, () {
      super._sortingType = value;
    });
  }

  late final _$_thresholdTimeAtom =
      Atom(name: '_SortingForm._thresholdTime', context: context);

  @override
  int? get _thresholdTime {
    _$_thresholdTimeAtom.reportRead();
    return super._thresholdTime;
  }

  @override
  set _thresholdTime(int? value) {
    _$_thresholdTimeAtom.reportWrite(value, super._thresholdTime, () {
      super._thresholdTime = value;
    });
  }

  late final _$_totalItemAtom =
      Atom(name: '_SortingForm._totalItem', context: context);

  @override
  int? get _totalItem {
    _$_totalItemAtom.reportRead();
    return super._totalItem;
  }

  @override
  set _totalItem(int? value) {
    _$_totalItemAtom.reportWrite(value, super._totalItem, () {
      super._totalItem = value;
    });
  }

  late final _$_isRunningAtom =
      Atom(name: '_SortingForm._isRunning', context: context);

  @override
  bool get _isRunning {
    _$_isRunningAtom.reportRead();
    return super._isRunning;
  }

  @override
  set _isRunning(bool value) {
    _$_isRunningAtom.reportWrite(value, super._isRunning, () {
      super._isRunning = value;
    });
  }

  late final _$_SortingFormActionController =
      ActionController(name: '_SortingForm', context: context);

  @override
  void setTotalItem(int totalItem) {
    final _$actionInfo = _$_SortingFormActionController.startAction(
        name: '_SortingForm.setTotalItem');
    try {
      return super.setTotalItem(totalItem);
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThresholdTime(int time) {
    final _$actionInfo = _$_SortingFormActionController.startAction(
        name: '_SortingForm.setThresholdTime');
    try {
      return super.setThresholdTime(time);
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSetSorting(SortingType sortingType) {
    final _$actionInfo = _$_SortingFormActionController.startAction(
        name: '_SortingForm.onSetSorting');
    try {
      return super.onSetSorting(sortingType);
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo =
        _$_SortingFormActionController.startAction(name: '_SortingForm.stop');
    try {
      return super.stop();
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void run() {
    final _$actionInfo =
        _$_SortingFormActionController.startAction(name: '_SortingForm.run');
    try {
      return super.run();
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortingType: ${sortingType},
thresholdTime: ${thresholdTime},
totalItem: ${totalItem},
isRunning: ${isRunning},
isDisableActionForm: ${isDisableActionForm}
    ''';
  }
}
