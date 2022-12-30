import 'package:flutter/material.dart';
import 'package:ebook/utils/consts.dart';
import 'package:ebook/utils/database.dart';
import 'package:ebook/widgets/downloads_item.dart';

class DownloadsScreen extends StatefulWidget {
  static String routeName = '/downloads-screen';

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  List downloadList = [];

  getDownloadsList() async {
    List l = await DownloadDatabase().listAll();
    setState(() {
      downloadList = l;
    });
  }

  @override
  void initState() {
    getDownloadsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.downloadsName),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: downloadList.length,
        itemBuilder: (ctx, index) {
          return DownloadsItem(
              id: downloadList[index]['id'],
              title: downloadList[index]['name'],
              imageUrl: downloadList[index]['image'],
              path: downloadList[index]['path']);
        },
      ),
    );
  }
}
