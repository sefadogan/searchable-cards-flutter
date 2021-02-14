// Packages
import 'package:flutter/material.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// Widgets
import 'package:SearchableCards/widgets/shared/scf_text/scf_text.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  PostCard({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: ScfText(post.title),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ScfText(post.body, maxLines: 3),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: ScfText(post.userId.toString()),
          ),
        ],
      ),
    );
  }
}
