// Models
import 'package:SearchableCards/models/post/post_model.dart';

class SetPostsAction {
  final List<PostModel> _posts;

  List<PostModel> get posts => this._posts;

  SetPostsAction(this._posts);
}
