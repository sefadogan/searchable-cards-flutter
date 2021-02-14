// State
import 'package:SearchableCards/state/redux/post_search_text/post_search_text.action.dart';

String postSearchTextReducer(String postSearchText, dynamic action) {
  if (action is SetPostSearchTextAction) {
    return action.postSearchText;
  }

  return postSearchText;
}
