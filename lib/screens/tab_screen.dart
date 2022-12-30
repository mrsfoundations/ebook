import 'package:flutter/material.dart';
import 'downloads_screen.dart';
import 'books_screen.dart';
import 'package:ebook/utils/consts.dart';
import 'package:ebook/utils/enums.dart';
import 'package:permission_handler/permission_handler.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  Future requestStoragePermission() async {
    PermissionStatus permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
    }
  }

  @override
  void initState() {
    requestStoragePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(DownloadsScreen.routeName);
                },
                icon: const Icon(Icons.download))
          ],
          title: Text(Constants.appName),
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(
              child: FittedBox(
                child: Text(
                  "Popular",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                child: Text(
                  "Sci-fi",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                child: Text(
                  "Adventure",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                child: Text(
                  "Mystery",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                child: Text(
                  "Romance",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: FittedBox(
                child: Text(
                  "Horror",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          BooksScreen(CategoryName.popular),
          BooksScreen(CategoryName.scifi),
          BooksScreen(CategoryName.adventure),
          BooksScreen(CategoryName.mystery),
          BooksScreen(CategoryName.romance),
          BooksScreen(CategoryName.horror)
        ]),
      ),
    );
  }
}
