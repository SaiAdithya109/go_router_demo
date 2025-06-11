import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/routes/router.dart';
import 'package:go_router_demo/routes/routes.dart';

final RouteNames routeNames = RouteNames();

class AppLayoutManager extends StatelessWidget {
  final Widget child;
  const AppLayoutManager({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return AppMobileLayout(child: child);
    } else {
      return AppWebLayout(child: child);
    }
  }
}

class AppMobileLayout extends StatelessWidget {
  final Widget child;
  const AppMobileLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
        ],
      ),
    );
  }
}

class AppWebLayout extends StatelessWidget {
  final Widget child;
  const AppWebLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _calculateSelectedIndex(context),
            onDestinationSelected: (index) => _onItemTapped(index, context),
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.list_alt), label: Text('Activity')),
              NavigationRailDestination(
                  icon: Icon(Icons.person), label: Text('Profile')),
              NavigationRailDestination(
                  icon: Icon(Icons.people), label: Text('Social')),
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final GoRouter route = GoRouter.of(context);
  final String location =
      route.routerDelegate.currentConfiguration.uri.toString();
  if (location == appRoutes.home) {
    return 0;
  }
  if (location == appRoutes.activity) {
    return 1;
  }
  if (location == appRoutes.profile) {
    return 2;
  }
  if (location == appRoutes.social) {
    return 3;
  }
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).goNamed(routeNames.home);
      break;
    case 1:
      GoRouter.of(context).goNamed(routeNames.activity);
      break;
    case 2:
      GoRouter.of(context).goNamed(routeNames.profile);
      break;
    case 3:
      GoRouter.of(context).goNamed(routeNames.social);
      break;
  }
}
