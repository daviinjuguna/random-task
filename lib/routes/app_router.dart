import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:interview/ui/home_page.dart';
import 'package:interview/ui/view/design_view.dart';
import 'package:interview/ui/view/dictionary_view.dart';
import 'package:interview/ui/view/info_view.dart';
import 'package:interview/ui/view/response_view.dart';

import '../objects/user_object.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: InfoView),
        AutoRoute(page: DesignView),
        AutoRoute(page: ResponseView),
        AutoRoute(page: DictionaryView),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);
}
