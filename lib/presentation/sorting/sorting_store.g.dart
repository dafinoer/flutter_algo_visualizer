// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sorting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SortingStore on _SortingStore, Store {
  Computed<List<double>>? _$listVisualizerComputed;

  @override
  List<double> get listVisualizer => (_$listVisualizerComputed ??=
          Computed<List<double>>(() => super.listVisualizer,
              name: '_SortingStore.listVisualizer'))
      .value;
  Computed<bool>? _$isRunningComputed;

  @override
  bool get isRunning =>
      (_$isRunningComputed ??= Computed<bool>(() => super.isRunning,
              name: '_SortingStore.isRunning'))
          .value;

  late final _$_visualDataAtom =
      Atom(name: '_SortingStore._visualData', context: context);

  @override
  List<double> get _visualData {
    _$_visualDataAtom.reportRead();
    return super._visualData;
  }

  @override
  set _visualData(List<double> value) {
    _$_visualDataAtom.reportWrite(value, super._visualData, () {
      super._visualData = value;
    });
  }

  late final _$_isRunningAtom =
      Atom(name: '_SortingStore._isRunning', context: context);

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

  late final _$_SortingStoreActionController =
      ActionController(name: '_SortingStore', context: context);

  @override
  void setDataItems(int maxItem) {
    final _$actionInfo = _$_SortingStoreActionController.startAction(
        name: '_SortingStore.setDataItems');
    try {
      return super.setDataItems(maxItem);
    } finally {
      _$_SortingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listVisualizer: ${listVisualizer},
isRunning: ${isRunning}
    ''';
  }
}
