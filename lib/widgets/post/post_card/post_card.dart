// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// Widgets
import 'package:SearchableCards/widgets/shared/controlled_text/controlled_text.dart';
// Helpers
import 'package:SearchableCards/common/helpers/user_helper.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  PostCard({@required this.post});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        final user = UserHelper.getUserById(post.userId, state);

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
                child: ControlledText(post.title),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ControlledText(post.body, maxLines: 3),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    ControlledText(user.name),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
