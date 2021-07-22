import 'package:flutter/material.dart';
import 'package:star_citizen_app/Screens/account_screen.dart';
import 'package:star_citizen_app/Screens/cart_screen.dart';
import 'package:star_citizen_app/Screens/data_screen.dart';
import 'package:star_citizen_app/Screens/hanger_screen.dart';
import 'package:star_citizen_app/Screens/mobile_screen.dart';

import 'Screens/backdrop.dart';
import 'Screens/widgets/component_selection.dart';
import 'Screens/widgets/stats_dashboard.dart';

import 'package:flutter/material.dart';

import 'constants.dart';

class NavigationPage {
  final String pageTitle;
  final List<dynamic> pageData;

  NavigationPage({required this.pageData,required this.pageTitle});
}

class PageRouteInformationParser extends RouteInformationParser<PageRoutePath> {
  @override
  Future<PageRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return PageRoutePath.home();
    }

    // Handle '/calculator/:page'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'calculator') return PageRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var page = int.tryParse(remaining);
      if (page == null) return PageRoutePath.unknown();
      return PageRoutePath.details(page);
    }

    // Handle unknown routes
    return PageRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(PageRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/calculator');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/calculator/${path.id}');
    }
    return null;
  }
}

class PageRouterDelegate extends RouterDelegate<PageRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationPage? _selectedPage;
  bool show404 = false;

  List<NavigationPage> pages = [
    // Page(pageTitle: 'Calculator'),
    NavigationPage(pageTitle: 'cart', pageData: []),
    NavigationPage(pageTitle: 'hangar', pageData: []),
    NavigationPage(pageTitle: 'ships&vehicles', pageData: []),
    NavigationPage(pageTitle: 'weapons', pageData: []),
    NavigationPage(pageTitle: 'missiles', pageData: []),
    NavigationPage(pageTitle: 'shields', pageData: []),
    NavigationPage(pageTitle: 'powerplants', pageData: []),
    NavigationPage(pageTitle: 'coolers', pageData: []),
    NavigationPage(pageTitle: 'quantumdrives', pageData: []),
    NavigationPage(pageTitle: 'emps', pageData: []),
    NavigationPage(pageTitle: 'qeds', pageData: []),
    NavigationPage(pageTitle: 'mininglasers', pageData: []),
    NavigationPage(pageTitle: 'account', pageData: []),
    NavigationPage(pageTitle: 'spreadlove', pageData: []),
    NavigationPage(pageTitle: 'about', pageData: []),
  ];

  PageRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  PageRoutePath get currentConfiguration {
    if (show404) {
      return PageRoutePath.unknown();
    }
    return _selectedPage == null
        ? PageRoutePath.home()
        : PageRoutePath.details(pages.indexOf(_selectedPage!));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey('calculator'),
            child: PagesListScreen(pages: pages, onTapped: _handleBookTapped)),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedPage != null)
          DetailsPage()
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedPage = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageRoutePath path) async {
    if (path.isUnknown) {
      _selectedPage = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id! < 0 || path.id! > pages.length - 1) {
        show404 = true;
        return;
      }

      _selectedPage = pages[path.id!];
    } else {
      _selectedPage = null;
    }

    show404 = false;
  }

  void _handleBookTapped(NavigationPage page) {
    _selectedPage = page;
    notifyListeners();
  }
}

class DetailsPage extends Page {
  final NavigationPage? page;

  DetailsPage({
    this.page,
  }) : super(key: ValueKey(page));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PageDetailsScreen(page: page);
      },
    );
  }
}

class PageRoutePath {
  final int? id;
  final bool isUnknown;

  PageRoutePath.home()
      : id = null,
        isUnknown = false;

  PageRoutePath.details(this.id) : isUnknown = false;

  PageRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class PagesListScreen extends StatelessWidget {
  final List<NavigationPage> pages;
  final ValueChanged<NavigationPage> onTapped;

  PagesListScreen({
    required this.pages,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            String routeName = '/${pages[index]}';
            if (index == 3 || index == 14) {
              return Divider(color: kGreyOnSurface, thickness: 2.0);
            } else {
              return ListTile(
                  // selected: pages[index] == currentPage,
                  // selectedTileColor: kPrimaryNavyVariant,
                  leading: Icon(Icons.data_usage_sharp),
                  title: Text(pages[index].pageTitle),
                  onTap: () => onTapped);
            }
          },
        );
  }
}

class PageDetailsScreen extends StatelessWidget {
  final NavigationPage? page;

  PageDetailsScreen({
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (page != null) ...[
              Text(page!.pageTitle, style: Theme.of(context).textTheme.headline6),
              Text(page!.pageData.toString(), style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}


// Route<dynamic> generateRoutes(RouteSettings settings) {
//   switch (settings.name) {
//     case 'Calculator':
//       return MaterialPageRoute(
//           builder: (context) => Backdrop(
//                 frontLayer: StatsDashboard(),
//                 backLayer: ComponentSelectionList(),
//                 frontTitle: 'CALCULATOR',
//                 backTitle: 'BUILD',
//               ));
//     case 'Cart':
//       return MaterialPageRoute(builder: (context) => CartScreen());
//     case 'Hanger':
//       return MaterialPageRoute(builder: (context) => HangerScreen());
//     case 'Ships&Vehicles':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'Weapons':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'Missiles':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'Shields':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'PowerPlants':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'Coolers':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'QuantumDrives':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'EMPs':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'QEDs':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'MiningLasers':
//       return MaterialPageRoute(
//           builder: (context) => MobileFrameWork(title: Text(settings.name!), body: ComponentDataTable(componentItems: [])));
//     case 'Account':
//       return MaterialPageRoute(builder: (context) => AccountScreen());
//     default:
//       return MaterialPageRoute(
//           builder: (context) => Scaffold(
//                 body: Center(
//                   child: Text('404 Page not found'),
//                 ),
//               ));
//   }
// }
