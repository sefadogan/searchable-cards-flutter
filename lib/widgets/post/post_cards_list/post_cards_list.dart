// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// Widgets
import 'package:SearchableCards/widgets/post/post_card/post_card.dart';
import 'package:SearchableCards/widgets/shared/search_no_result/search_no_result.dart';
import 'package:SearchableCards/widgets/post/post_detail_bottom_sheet_content/post_detail_bottom_sheet_content.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';

class PostCardsList extends StatelessWidget {
  void _onTappedPostCard(PostModel post, BuildContext context) {
    FocusScope.of(context).unfocus();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PostDetailBottomSheetContent(post);
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
