import 'package:algovisualizer/presentation/nav_menu_store/nav_menu_store.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../components/string_value.dart';

class NavMenuMobile extends StatelessWidget {
  const NavMenuMobile({Key? key, required this.navMenuStore}) : super(key: key);
  final NavMenuStore navMenuStore;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        itemCount: _menu.length,
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        itemBuilder: (context, index) => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          color: navMenuStore.indexChoice == index
              ? const Color(0xffC2E7FF)
              : Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            hoverColor: const Color(0xffC2E7FF),
            onTap: () {
              navMenuStore.onChangeIndex(index);
              AutoRouter.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(_menu[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

  List<String> get _menu {
    return <String>[
      StringValue.home,
      StringValue.sort,
    ];
  }
}
