import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/views/auth/login.dart';
import 'package:quadleo_machine_test/views/auth/splash_screen.dart';
import 'package:quadleo_machine_test/views/home/home_page.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case home:
        return MaterialPageRoute(builder: (_) =>  HomePage());
       default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }

}