// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// Dumy Data
import 'package:SearchableCards/dummy_data.dart';
// Models
import 'package:SearchableCards/models/post/post_model.dart';
// State
import 'package:SearchableCards/state/redux/actions.dart';
import 'package:SearchableCards/state/redux/app_state.dart';

class PostSearchBar extends StatefulWidget {
  @override
  _PostSearchBarState createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  TextEditingController _editingController = TextEditingController();

  void _onChangedSearchValue(String value) {
    final store = StoreProvider.of<AppState>(context);
    final posts = PostModel.listFromJson(DummyData.posts);

    store.dispatch(SetPostSearchTextAction(value));

    if (value.length == 0) {
      store.dispatch(SetPostsAction(posts));
    }

    final filteredPosts = posts.where((post) => post.title.contains(value) || post.body.contains(value)).toList();
    store.dispatch(SetPostsAction(filteredPosts));
  }

  void _onPressedClose() {
    final store = StoreProvider.of<AppState>(context);

    _editingController.clear();

    store.dispatch(SetPostSearchTextAction(''));
    store.dispatch(SetPostsAction(PostModel.listFromJson(DummyData.posts)));

    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return TextField(
          cursorColor: const Color(0xff1a202c),
          controller: _editingController,
          onChanged: (value) => _onChangedSearchValue(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search...',
            contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffe2e8f0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffe2e8f0)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            prefixIcon: const Icon(Icons.search, color: Color(0xff1a202c)),
            suffixIcon: state.postSearchText.length > 0
                ? IconButton(
                    icon: const Icon(Icons.close, color: Color(0xff1a202c)),
                    iconSize: 16,
                    onPressed: _onPressedClose,
                  )
                : null,
          ),
        );
      },
    );
  }
}
