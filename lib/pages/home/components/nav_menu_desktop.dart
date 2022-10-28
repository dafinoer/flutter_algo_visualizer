import 'package:algovisualizer/presentation/nav_menu_store/nav_menu_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../components/string_value.dart';

class NavMenuDesktop extends StatelessWidget {
  const NavMenuDesktop({Key? key, required this.menuStore}) : super(key: key);

  final NavMenuStore menuStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => NavigationRail(
        backgroundColor: const Color(0xffF3F6FC),
        minWidth: 58.0,
        elevation: 5.0,
        onDestinationSelected: (value) => menuStore.onChangeIndex(value),
        indicatorColor: const Color(0xffC2E7FF),
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home_filled),
            label: Text(StringValue.home),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.sort),
            label: Text(StringValue.sort),
          )
        ],
        selectedIndex: menuStore.indexChoice,
      ),
    );
  }
}
