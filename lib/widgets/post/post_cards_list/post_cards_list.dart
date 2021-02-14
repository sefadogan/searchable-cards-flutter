// Packages
import 'package:flutter/material.dart';
// Widgets
import 'package:SearchableCards/widgets/post/post_card/post_card.dart';
import 'package:flutter_redux/flutter_redux.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';

class PostCardsList extends StatelessWidget {
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
