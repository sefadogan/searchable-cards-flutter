// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
// Routes
import 'package:SearchableCards/routes/custom_router.dart';
import 'package:SearchableCards/routes/route_names.dart';
// State
import 'package:SearchableCards/state/redux/app_store.dart';
import 'package:SearchableCards/state/redux/app_state.dart';

void main() {
  final store = AppStore.getInitialStore();

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Searchable Cards',
            theme: ThemeData(fontFamily: 'Quicksand', visualDensity: VisualDensity.adaptivePlatformDensity),
            onGenerateRoute: CustomRouter.allRoutes,
            initialRoute: RouteNames.home,
          );
        },
      ),
    );
  }
}
