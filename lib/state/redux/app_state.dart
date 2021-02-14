// Packages
import 'package:meta/meta.dart';
// Dumm Data
import 'package:SearchableCards/dummy_data.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';

@immutable
class AppState {
  final List<PostModel> posts;
  final String postSearchText;

  AppState({@required this.posts, @required this.postSearchText});

  factory AppState.initial() {
    var appState = AppState(
      posts: PostModel.listFromJson(DummyData.posts),
      postSearchText: '',
    );

    return appState;
  }
}
