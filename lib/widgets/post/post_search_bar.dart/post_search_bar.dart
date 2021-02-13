// Packages
import 'package:flutter/material.dart';

class PostSearchBar extends StatefulWidget {
  @override
  _PostSearchBarState createState() => _PostSearchBarState();
}

class _PostSearchBarState extends State<PostSearchBar> {
  String _textValue = '';
  TextEditingController _editingController = TextEditingController();

  void _setTextValue(String value) {
    setState(() {
      _textValue = value;
    });
  }

  void _onChangedSearchValue(String value) {
    _setTextValue(value);
  }

  void _onPressedClose() {
    _editingController.clear();
    _setTextValue('');

    FocusScope.of(context).unfocus();
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffe2e8f0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffe2e8f0)),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xff1a202c)),
        suffixIcon: _textValue.length > 0
            ? IconButton(
                icon: const Icon(Icons.close, color: Color(0xff1a202c)),
                iconSize: 16,
                onPressed: _onPressedClose,
              )
            : null,
      ),
    );
  }
}
