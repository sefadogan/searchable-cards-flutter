// Packages
import 'package:meta/meta.dart';
// Dumm Data
import 'package:SearchableCards/dummy_data.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
import 'package:SearchableCards/models/user/user_model.dart';

@immutable
class AppState {
  final List<PostModel> posts;
  final String postSearchText;
  final List<UserModel> users;

  AppState({
    @required this.posts,
    @required this.postSearchText,
    @required this.users,
  });

  factory AppState.initial() {
    var appState = AppState(
      posts: PostModel.listFromJson(DummyData.posts),
      postSearchText: '',
      users: UserModel.listFromJson(DummyData.users),
    );

    return appState;
  }
}
