// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeScreenPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeScreenPage(),
      );
    },
    WelcomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
    SortingPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SortingPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeScreenPageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: HomeScreenPageRoute.name,
              redirectTo: 'welcome',
              fullMatch: true,
            ),
            RouteConfig(
              WelcomePageRoute.name,
              path: 'welcome',
              parent: HomeScreenPageRoute.name,
            ),
            RouteConfig(
              SortingPageRoute.name,
              path: 'sorting',
              parent: HomeScreenPageRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [HomeScreenPage]
class HomeScreenPageRoute extends PageRouteInfo<void> {
  const HomeScreenPageRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeScreenPageRoute';
}

/// generated route for
/// [WelcomePage]
class WelcomePageRoute extends PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [SortingPage]
class SortingPageRoute extends PageRouteInfo<void> {
  const SortingPageRoute()
      : super(
          SortingPageRoute.name,
          path: 'sorting',
        );

  static const String name = 'SortingPageRoute';
}
