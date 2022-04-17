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
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>(
          orElse: () => const HomePageRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData, child: HomePage(key: args.key));
    },
    InfoViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const InfoView());
    },
    DesignViewRoute.name: (routeData) {
      final args = routeData.argsAs<DesignViewRouteArgs>(
          orElse: () => const DesignViewRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: DesignView(key: args.key, user: args.user));
    },
    ResponseViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ResponseView());
    },
    DictionaryViewRoute.name: (routeData) {
      final args = routeData.argsAs<DictionaryViewRouteArgs>(
          orElse: () => const DictionaryViewRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData, child: DictionaryView(key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/', children: [
          RouteConfig(InfoViewRoute.name,
              path: 'info-view', parent: HomePageRoute.name),
          RouteConfig(DesignViewRoute.name,
              path: 'design-view', parent: HomePageRoute.name),
          RouteConfig(ResponseViewRoute.name,
              path: 'response-view', parent: HomePageRoute.name),
          RouteConfig(DictionaryViewRoute.name,
              path: 'dictionary-view', parent: HomePageRoute.name)
        ])
      ];
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({Key? key, List<PageRouteInfo>? children})
      : super(HomePageRoute.name,
            path: '/',
            args: HomePageRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [InfoView]
class InfoViewRoute extends PageRouteInfo<void> {
  const InfoViewRoute() : super(InfoViewRoute.name, path: 'info-view');

  static const String name = 'InfoViewRoute';
}

/// generated route for
/// [DesignView]
class DesignViewRoute extends PageRouteInfo<DesignViewRouteArgs> {
  DesignViewRoute({Key? key, UserObject? user})
      : super(DesignViewRoute.name,
            path: 'design-view',
            args: DesignViewRouteArgs(key: key, user: user));

  static const String name = 'DesignViewRoute';
}

class DesignViewRouteArgs {
  const DesignViewRouteArgs({this.key, this.user});

  final Key? key;

  final UserObject? user;

  @override
  String toString() {
    return 'DesignViewRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [ResponseView]
class ResponseViewRoute extends PageRouteInfo<void> {
  const ResponseViewRoute()
      : super(ResponseViewRoute.name, path: 'response-view');

  static const String name = 'ResponseViewRoute';
}

/// generated route for
/// [DictionaryView]
class DictionaryViewRoute extends PageRouteInfo<DictionaryViewRouteArgs> {
  DictionaryViewRoute({Key? key})
      : super(DictionaryViewRoute.name,
            path: 'dictionary-view', args: DictionaryViewRouteArgs(key: key));

  static const String name = 'DictionaryViewRoute';
}

class DictionaryViewRouteArgs {
  const DictionaryViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DictionaryViewRouteArgs{key: $key}';
  }
}
