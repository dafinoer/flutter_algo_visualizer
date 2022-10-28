import 'package:mobx/mobx.dart';

part 'nav_menu_store.g.dart';

class NavMenuStore = _NavMenuStore with _$NavMenuStore;

abstract class _NavMenuStore with Store {
  @observable
  int _indexChoice = 0;

  @computed
  int get indexChoice => _indexChoice;

  @action
  void onChangeIndex(int index) {
    _indexChoice = index;
  }
}
