// Packages
import 'package:flutter/material.dart';

class PostSearchBar extends StatefulWidget {
  @override
  _PostSearchBarState createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  TextEditingController _editingController = TextEditingController();

  void _onChangedSearchValue(String value) {
    print('Writen text value = $value');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff1a202c),
      controller: _editingController,
      onChanged: (value) => _onChangedSearchValue(value),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search...',
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffe2e8f0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffe2e8f0)),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        suffixIcon: _editingController.text.length == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.close),
                iconSize: 16,
                onPressed: () => {},
              ),
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      ),
    );
  }
}
