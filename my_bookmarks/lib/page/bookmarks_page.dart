import 'package:flutter/material.dart';
import 'package:my_bookmarks/model/bookmark.dart';
import 'package:my_bookmarks/page/add_bookmark_page.dart';
import 'package:my_bookmarks/util/navigation_util.dart';
import 'package:my_bookmarks/widget/bookmarks_grid_widget.dart';
import 'package:my_bookmarks/widget/bookmarks_list_widget.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isGridMode = false;
  List<Bookmark> bookmarksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookmarks"),
        actions: [
          IconButton(
              icon: isGridMode
                  ? Icon(Icons.list, color: Colors.white)
                  : Icon(Icons.grid_on, color: Colors.black),
              onPressed: () {
                setState(() {
                  isGridMode = !isGridMode;
                });
              }),
        ],
      ),
      body: isGridMode
          ? BookmarksGridWidget(bookmarksList)
          : BookmarksListWidget(bookmarksList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () => onAddButtonPressed(context),
        label: Text("Add"),
      ),
    );
  }

  void onAddButtonPressed(BuildContext context) async {
    final result = await navigateToAddBookmarkPage(context);

    if (result != null && result is Bookmark) {
      setState(() {
        bookmarksList.add(result);
      });
    }
  }
}
