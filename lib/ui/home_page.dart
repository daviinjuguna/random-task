import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/routes/app_router.dart';
import 'package:interview/ui/view/design_view.dart';
import 'package:interview/ui/view/dictionary_view.dart';
import 'package:interview/ui/view/info_view.dart';
import 'package:interview/ui/view/response_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _tabs = [
    InfoView(),
    DesignView(),
    ResponseView(),
    DictionaryView(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // appBarBuilder: (context, tabsRouter) {
      //   String _title() {
      //     switch (tabsRouter.current.name) {
      //       case InfoViewRoute.name:
      //         return "Info";
      //       case DesignViewRoute.name:
      //         return "Design";
      //       case ResponseViewRoute.name:
      //         return "Response";
      //       case DictionaryViewRoute.name:
      //         return "Dictionary";
      //       default:
      //         return "";
      //     }
      //   }

      //   return AppBar(
      //     backgroundColor: Theme.of(context).colorScheme.background,
      //     centerTitle: true,
      //     elevation: 0,
      //     title: Text(
      //       _title(),
      //       style: TextStyle(
      //         color: Theme.of(context).colorScheme.onBackground,
      //       ),
      //     ),
      //   );
      // },
      routes: [
        InfoViewRoute(),
        DesignViewRoute(),
        ResponseViewRoute(),
        DictionaryViewRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey[400],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.palette),
              label: 'Design',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_array),
              label: 'Response',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page),
              label: 'Dictionary',
            )
          ],
        );
      },
    );
    // return Scaffold(
    //   // resizeToAvoidBottomInset: false,
    //   body: CupertinoTabScaffold(
    //     resizeToAvoidBottomInset: false,
    //     tabBar: CupertinoTabBar(
    // items: [
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.info),
    //     label: 'Info',
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.palette),
    //     label: 'Design',
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.data_array),
    //     label: 'Response',
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.find_in_page),
    //     label: 'Dictionary',
    //   )
    // ],
    //     ),
    //     tabBuilder: (_, i) => _tabs[i],
    //   ),
    // );
  }
}
