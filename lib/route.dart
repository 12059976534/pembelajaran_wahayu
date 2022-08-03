import 'package:flutter/material.dart';

import 'future/present/screen/blockscreen/allpokescreen.dart';
import 'future/present/screen/provider/screenList.dart';
import 'future/present/screen/provider/scrennpilih.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home-route':
        // final String title = settings.arguments;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => Listprvider(),
            // Allpokescreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));
      case '/screen_dipilih':
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => Scrennpilih(),
            // Allpokescreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
