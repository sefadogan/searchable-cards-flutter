// Packages
import 'package:flutter/material.dart';
// Widgets
import 'package:SearchableCards/widgets/shared/controlled_text/controlled_text.dart';
import 'package:SearchableCards/widgets/post/post_cards_list/post_cards_list.dart';
import 'package:SearchableCards/widgets/post/post_search_bar.dart/post_search_bar.dart';
// Dummy Data
import 'package:flutter_redux/flutter_redux.dart';
// State
import 'package:SearchableCards/state/redux/app_state.dart';
// Styles
import 'package:SearchableCards/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ControlledText("Searchable Cards - Redux"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        brightness: Brightness.light,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostSearchBar(),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 6),
                      child: ControlledText(
                        "POSTS",
                        style: contentDividerTitleTextStyle(),
                      ),
                    ),
                    PostCardsList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
