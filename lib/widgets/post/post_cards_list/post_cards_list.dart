// Packages
import 'package:flutter/material.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// Widgets
import 'package:SearchableCards/widgets/post/post_card/post_card.dart';

class PostCardsList extends StatelessWidget {
  final List<PostModel> posts;

  PostCardsList({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int idx) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: PostCard(post: posts[idx]),
        );
      },
    );
  }
}
