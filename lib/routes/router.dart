import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Added for MediaQuery
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/layout/auth_layout_manager.dart';
import 'package:go_router_demo/layout/app_layout_manager.dart'; // Added
import 'package:go_router_demo/routes/routes.dart';
import 'package:go_router_demo/screens/forgot_password.dart';
import 'package:go_router_demo/screens/home.dart';
import 'package:go_router_demo/screens/introduction_screen.dart';
import 'package:go_router_demo/screens/login_screen.dart';
import 'package:go_router_demo/screens/register_options.dart';
import 'package:go_router_demo/screens/register_screen.dart';
import 'package:go_router_demo/screens/activity_screen.dart'; // Added
import 'package:go_router_demo/screens/profile_screen.dart'; // Added
import 'package:go_router_demo/screens/social_screen.dart'; // Added
// SEO imports - web only
import 'package:go_router_demo/seo/seo_service.dart' if (dart.library.io) 'package:go_router_demo/seo/seo_service_mobile.dart';

final Routes appRoutes = Routes();
final RouteNames routeNames = RouteNames();

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      ...AuthRoutes.routes,
      ...PostAuthRoutes.routes
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final bool isNavigatingToRoot = state.uri.toString() == "/";

      if (isNavigatingToRoot) {
        final screenWidth = MediaQuery.of(context).size.width;
        if (screenWidth < 600) {
          return appRoutes.introScreen;
        } else {
          return appRoutes.login;
        }
      }
      
      // Update SEO on route changes (web only)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SeoService.instance.updateForRoute(state);
      });
      
      return null;
    },
  );
}

class AuthRoutes {
  static final routes = [
    ShellRoute(
        builder: (context, state, child) {
          return AuthLayoutManager(child: child);
        },
        routes: [
          GoRoute(
            path: appRoutes.introScreen,
            name: routeNames.introScreen,
            builder: (context, state) => const IntroductionScreen(),
          ),
          GoRoute(
            path: appRoutes.login,
            name: routeNames.login,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: appRoutes.register,
            name: routeNames.register,
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(
            path: appRoutes.registerOptions,
            name: routeNames.registerOptions,
            builder: (context, state) => const RegisterOptions(),
          ),
          GoRoute(
            path: appRoutes.forgotPassword,
            name: routeNames.forgotPassword,
            builder: (context, state) => const ForgotPassword(),
          ),
        ])
  ];
}

class PostAuthRoutes {
  static final routes = [
    ShellRoute(
      // Added ShellRoute for main app layout
      builder: (context, state, child) {
        return AppLayoutManager(child: child);
      },
      routes: [
        GoRoute(
          path: appRoutes.home,
          name: routeNames.home,
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: appRoutes.activity,
          name: routeNames.activity,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: appRoutes.profile,
          name: routeNames.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: appRoutes.social,
          name: routeNames.social,
          builder: (context, state) => const SocialScreen(),
        ),
      ],
    ),
  ];
}
