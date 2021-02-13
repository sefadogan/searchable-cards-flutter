// Packages
import 'package:flutter/material.dart';
// Routes
import 'package:SearchableCards/routes/custom_router.dart';
import 'package:SearchableCards/routes/route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Searchable Cards',
      theme: ThemeData(fontFamily: 'Quicksand', visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: RouteNames.home,
    );
  }
}
