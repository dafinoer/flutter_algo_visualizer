import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../pages/home/home_screen_page.dart';
import '../pages/sorting/sorting_page.dart';
import '../pages/welcome/welcome_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(routes: [
  AutoRoute(
    path: '/',
    page: HomeScreenPage,
    children: [
      AutoRoute(path: 'welcome', page: WelcomePage, initial: true),
      AutoRoute(path: 'sorting', page: SortingPage)
    ],
  )
])
class AppRouter extends _$AppRouter {
  AppRouter();

  static final AppRouter _internal = AppRouter();

  factory AppRouter.create() => _internal;
}
