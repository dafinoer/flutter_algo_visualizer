// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavMenuStore on _NavMenuStore, Store {
  Computed<int>? _$indexChoiceComputed;

  @override
  int get indexChoice =>
      (_$indexChoiceComputed ??= Computed<int>(() => super.indexChoice,
              name: '_NavMenuStore.indexChoice'))
          .value;

  late final _$_indexChoiceAtom =
      Atom(name: '_NavMenuStore._indexChoice', context: context);

  @override
  int get _indexChoice {
    _$_indexChoiceAtom.reportRead();
    return super._indexChoice;
  }

  @override
  set _indexChoice(int value) {
    _$_indexChoiceAtom.reportWrite(value, super._indexChoice, () {
      super._indexChoice = value;
    });
  }

  late final _$_NavMenuStoreActionController =
      ActionController(name: '_NavMenuStore', context: context);

  @override
  void onChangeIndex(int index) {
    final _$actionInfo = _$_NavMenuStoreActionController.startAction(
        name: '_NavMenuStore.onChangeIndex');
    try {
      return super.onChangeIndex(index);
    } finally {
      _$_NavMenuStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexChoice: ${indexChoice}
    ''';
  }
}
