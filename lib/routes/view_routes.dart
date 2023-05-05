import 'package:flutter/material.dart';
import 'package:login_sqlite/screens/home_login.dart';
import 'package:login_sqlite/screens/signup_form.dart';
import 'package:login_sqlite/screens/update_form.dart';

class RoutesApp {
  static const home = '/';
  static const signUp = '/signup';
  static const update = '/update';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeLogin());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case update:
        return MaterialPageRoute(builder: (context) => const UpdateUser());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("ERRO"),
        ),
      );
    });
  }
}
