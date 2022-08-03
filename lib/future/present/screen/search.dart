import 'package:flutter/material.dart';

import 'blockscreen/searchscreen.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // return Text("");
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // return null;
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Searchscreen(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Text(""),
    );
  }
}
