import 'package:agony_coffee_app/pages/login/login_page.dart';
import 'package:agony_coffee_app/pages/register/register_page.dart';
import 'package:agony_coffee_app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
    case RouteName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteName.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      // case RouteName.homeRoute:
      //   return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

class RouteName {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
}
