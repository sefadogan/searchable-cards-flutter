// Models
import 'package:SearchableCards/models/post/post_model.dart';
// State
import 'package:SearchableCards/state/redux/posts/posts.action.dart';

List<PostModel> postsReducer(List<PostModel> posts, dynamic action) {
  if (action is SetPostsAction) {
    return action.posts;
  }

  return posts;
}
