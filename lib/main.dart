import 'package:flutter/material.dart';
import 'package:interview/routes/app_router.dart';

import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: "Interview",
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(5),
          border: UnderlineInputBorder(),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(5),
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
}
