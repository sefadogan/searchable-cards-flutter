// State
import 'package:SearchableCards/state/redux/app_state.dart';
import 'package:SearchableCards/state/redux/reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    posts: postsReducer(state.posts, action),
    postSearchText: postSearchTextReducer(state.postSearchText, action),
  );
}
