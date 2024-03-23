import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class BookmarkIcon extends StatefulWidget {
  late int numBookmarked;

  BookmarkIcon({super.key, required this.numBookmarked});

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  Set<String> bookmarks = {};
  late bool bookmarked;

  @override
  void initState() {
    super.initState();
    bookmarked = false;
  }

  addBookmark() {
    setState(() {
      bookmarked = true;
      widget.numBookmarked += 1;
    });
  }

  removeBookmark() {
    setState(() {
      bookmarked = false;
      widget.numBookmarked -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: bookmarked ? removeBookmark : addBookmark,
            child: bookmarked
                ? const Icon(Icons.bookmark_added_rounded, color: darkBlue)
                : const Icon(Icons.bookmark_add_rounded, color: darkBlue)),
        Text(
          widget.numBookmarked.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
