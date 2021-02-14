// Packages
import 'package:redux/redux.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';
import 'package:SearchableCards/state/redux/app_reducer.dart';

class AppStore {
  static Store<AppState> currentStore;

  static Store<AppState> getInitialStore() {
    return Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );
  }
}
