// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// Helpers
import 'package:SearchableCards/common/helpers/user_helper.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';
// Styles
import 'package:SearchableCards/styles/styles.dart';
// Widgets
import 'package:SearchableCards/widgets/shared/bottom_sheet_divider/bottom_sheet_divider.dart';
import 'package:SearchableCards/widgets/shared/controlled_text/controlled_text.dart';

class PostDetailBottomSheetContent extends StatelessWidget {
  final PostModel post;

  PostDetailBottomSheetContent(this.post);

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    //? Author
    final user = UserHelper.getUserById(post.userId, store.state);

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
  }
}
