// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorting_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SortingForm on _SortingForm, Store {
  Computed<int>? _$totalItemComputed;

  @override
  int get totalItem => (_$totalItemComputed ??=
          Computed<int>(() => super.totalItem, name: '_SortingForm.totalItem'))
      .value;
  Computed<int>? _$thresHoleTimeComputed;

  @override
  int get thresHoleTime =>
      (_$thresHoleTimeComputed ??= Computed<int>(() => super.thresHoleTime,
              name: '_SortingForm.thresHoleTime'))
          .value;
  Computed<SortingType?>? _$sortingTypeComputed;

  @override
  SortingType? get sortingType =>
      (_$sortingTypeComputed ??= Computed<SortingType?>(() => super.sortingType,
              name: '_SortingForm.sortingType'))
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

  late final _$_thresHoleTimeAtom =
      Atom(name: '_SortingForm._thresHoleTime', context: context);

  @override
  int get _thresHoleTime {
    _$_thresHoleTimeAtom.reportRead();
    return super._thresHoleTime;
  }

  @override
  set _thresHoleTime(int value) {
    _$_thresHoleTimeAtom.reportWrite(value, super._thresHoleTime, () {
      super._thresHoleTime = value;
    });
  }

  late final _$_totalMaxItemAtom =
      Atom(name: '_SortingForm._totalMaxItem', context: context);

  @override
  int get _totalMaxItem {
    _$_totalMaxItemAtom.reportRead();
    return super._totalMaxItem;
  }

  @override
  set _totalMaxItem(int value) {
    _$_totalMaxItemAtom.reportWrite(value, super._totalMaxItem, () {
      super._totalMaxItem = value;
    });
  }

  late final _$_isDisableButtonAtom =
      Atom(name: '_SortingForm._isDisableButton', context: context);

  @override
  bool get _isDisableButton {
    _$_isDisableButtonAtom.reportRead();
    return super._isDisableButton;
  }

  @override
  set _isDisableButton(bool value) {
    _$_isDisableButtonAtom.reportWrite(value, super._isDisableButton, () {
      super._isDisableButton = value;
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
  void setThresHoleTime(int time) {
    final _$actionInfo = _$_SortingFormActionController.startAction(
        name: '_SortingForm.setThresHoleTime');
    try {
      return super.setThresHoleTime(time);
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
  void onDisableButton(bool isDisable) {
    final _$actionInfo = _$_SortingFormActionController.startAction(
        name: '_SortingForm.onDisableButton');
    try {
      return super.onDisableButton(isDisable);
    } finally {
      _$_SortingFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalItem: ${totalItem},
thresHoleTime: ${thresHoleTime},
sortingType: ${sortingType},
isDisableActionForm: ${isDisableActionForm}
    ''';
  }
}
