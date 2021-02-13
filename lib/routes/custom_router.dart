// Packages
import 'package:flutter/material.dart';
// Pages
import 'package:SearchableCards/pages/error/not_found_page.dart';
import 'package:SearchableCards/pages/home/home_page.dart';
// Routes
import 'package:SearchableCards/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => HomePage());
    }

    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
