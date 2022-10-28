import 'package:algovisualizer/components/app_router.dart';
import 'package:algovisualizer/components/app_theme.dart';
import 'package:algovisualizer/components/injector.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  onRegisterInjector();
  runApp(MyApp(router: AppRouter.create()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Visualizer Demo',
          theme: themeLight,
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),
        );
      },
    );
  }
}
