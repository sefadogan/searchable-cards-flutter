// Packages
import 'package:SearchableCards/state/redux/app_state.dart';
import 'package:flutter/material.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// Widgets
import 'package:SearchableCards/widgets/post/post_card/post_card.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PostCardsList extends StatelessWidget {
  // List<PostModel> getFilteredPosts() {
  //   final String textValue = _editingController.text;

  //   if (textValue.length == 0) {
  //     return _posts;
  //   }

  //   return _posts.where((post) => post.title.contains(textValue) || post.body.contains(textValue)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.posts.length,
          itemBuilder: (BuildContext context, int idx) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: PostCard(post: state.posts[idx]),
            );
          },
        );
      },
    );
  }
}
