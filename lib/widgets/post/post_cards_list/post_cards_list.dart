// Packages
import 'package:SearchableCards/common/helpers/user_helper.dart';
import 'package:SearchableCards/styles/styles.dart';
import 'package:SearchableCards/widgets/shared/bottom_sheet_divider/bottom_sheet_divider.dart';
import 'package:SearchableCards/widgets/shared/controlled_text/controlled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// Widgets
import 'package:SearchableCards/widgets/post/post_card/post_card.dart';
import 'package:SearchableCards/widgets/shared/search_no_result/search_no_result.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';

class PostCardsList extends StatelessWidget {
  void _onTappedPostCard(PostModel post, BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    //? Author
    final user = UserHelper.getUserById(post.userId, store.state);

    FocusScope.of(context).unfocus();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.75,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  children: [
                    // Icon(Icons.remove, color: Colors.grey[600]),
                    BottomSheetDivider(),
                    ControlledText(
                      "Post Detail",
                      style: bottomSheetTitleTextStyle(),
                    ),
                    Expanded(
                      child: ListView(
                        controller: controller,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("TITLE", style: contentDividerTitleTextStyle()),
                                Text(post.title),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("BODY", style: contentDividerTitleTextStyle()),
                                Text(post.body),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("AUTHOR INFO", style: contentDividerTitleTextStyle()),
                                Text('Name: ${user.name}'),
                                Text('Phone: ${user.phone}'),
                                Text('Email: ${user.email}'),
                                Text('Username: ${user.username}'),
                                Text('Website: ${user.website}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return state.posts.length > 0
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int idx) {
                  return GestureDetector(
                    onTap: () => _onTappedPostCard(state.posts[idx], context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: PostCard(post: state.posts[idx]),
                    ),
                  );
                },
              )
            : SearchNoResult();
      },
    );
  }
}
