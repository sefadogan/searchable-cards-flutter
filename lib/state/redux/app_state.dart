// Packages
import 'package:SearchableCards/dummy_data.dart';
import 'package:SearchableCards/models/post/post_model.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<PostModel> posts;

  AppState({@required this.posts});

  factory AppState.initial() {
    var appState = AppState(
      posts: PostModel.listFromJson(DummyData.posts),
    );

    return appState;
  }
}
