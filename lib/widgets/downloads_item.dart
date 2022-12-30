import 'dart:math';
import 'package:flutter/material.dart';
import 'package:epub_viewer/epub_viewer.dart';


class DownloadsItem extends StatefulWidget {
  String id;
  String title;
  String imageUrl;
  String path;
  DownloadsItem(
      {required this.id,
        required this.title,
        required this.imageUrl,
        required this.path});

  @override
  State<DownloadsItem> createState() => _DownloadsItemState();
}

class _DownloadsItemState extends State<DownloadsItem> {
  void openEpub(String path) {
    EpubViewer.setConfig(
      identifier: 'androidBook',
      themeColor: Theme.of(context).colorScheme.secondary,
      scrollDirection: EpubScrollDirection.VERTICAL,
      enableTts: false,
      allowSharing: true,
    );
    EpubViewer.open(path, lastLocation: null);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openEpub(widget.path),
      child: Dismissible(
        confirmDismiss: (direction) => showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to remove this download'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes'))
              ],
            )),
        direction: DismissDirection.endToStart,

        key: ValueKey(widget.id),
        background: Container(
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 30,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(widget.title.substring(0, 3)))),
              title: Text(widget.title),
            ),
          ),
        ),
      ),
    );
  }
}
