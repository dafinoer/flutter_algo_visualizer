import 'package:algovisualizer/components/app_router.dart';
import 'package:algovisualizer/pages/home/components/nav_menu_desktop.dart';
import 'package:algovisualizer/pages/home/components/nav_menu_mobile.dart';
import 'package:algovisualizer/pages/home/desktop_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../presentation/nav_menu_store/nav_menu_store.dart';
import 'device_screen.dart';
import 'package:auto_route/auto_route.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late final NavMenuStore navMenuStore;
  late final GlobalKey<AutoRouterState> navHomeGlobalKey;

  @override
  void initState() {
    super.initState();
    navMenuStore = NavMenuStore();
    navHomeGlobalKey = GlobalKey<AutoRouterState>();
    reaction(
      (_) => navMenuStore.indexChoice,
      (msg) {
        final router = navHomeGlobalKey.currentState?.controller;
        if (msg == 0) {
          router?.push(const WelcomePageRoute());
        } else if (msg == 1) {
          router?.push(const SortingPageRoute());
        }
      },
    );
  }

  @override
  void dispose() {
    navHomeGlobalKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < 600) {
            return DeviceScreen(
                menu: NavMenuMobile(navMenuStore: navMenuStore),
                content: AutoRouter(key: navHomeGlobalKey));
          }
          return DesktopScreen(
              menu: NavMenuDesktop(menuStore: navMenuStore),
              content: AutoRouter(key: navHomeGlobalKey));
        },
      ),
    );
  }
}
