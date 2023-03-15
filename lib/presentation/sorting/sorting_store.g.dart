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
  Computed<bool>? _$isProcessSortingComputed;

  @override
  bool get isProcessSorting => (_$isProcessSortingComputed ??= Computed<bool>(
          () => super.isProcessSorting,
          name: '_SortingStore.isProcessSorting'))
      .value;
  Computed<Set<double>?>? _$indexActiveColorComputed;

  @override
  Set<double>? get indexActiveColor => (_$indexActiveColorComputed ??=
          Computed<Set<double>?>(() => super.indexActiveColor,
              name: '_SortingStore.indexActiveColor'))
      .value;

  late final _$_indexColorValueAtom =
      Atom(name: '_SortingStore._indexColorValue', context: context);

  @override
  Set<double>? get _indexColorValue {
    _$_indexColorValueAtom.reportRead();
    return super._indexColorValue;
  }

  @override
  set _indexColorValue(Set<double>? value) {
    _$_indexColorValueAtom.reportWrite(value, super._indexColorValue, () {
      super._indexColorValue = value;
    });
  }

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
isProcessSorting: ${isProcessSorting},
indexActiveColor: ${indexActiveColor}
    ''';
  }
}
