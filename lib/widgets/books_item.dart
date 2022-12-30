import 'package:flutter/material.dart';
import 'package:ebook/utils/enums.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/book_detail_screen2.dart';

class BooksItem extends StatelessWidget {
  String id;
  String title;
  String author;
  String url;
  CategoryName category;
  BooksItem(
      {required this.category,
        required this.id,
        required this.title,
        required this.author,
        required this.url});

  @override
  Widget build(BuildContext context) {
    showBookDetails() {
      Navigator.of(context).pushNamed(BookDetailsScreen2.routeName,
          arguments: {'id': id, 'categoryname': category});
    }

    return InkWell(
      onTap: (() => showBookDetails()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              shadowColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              elevation: 4,
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Center(
                      child:Image.network('https://picsum.photos/250?image=9'),
                      // FadeInImage.memoryNetwork(
                      //     placeholder: kTransparentImage, image: url),
                    )
                  ],
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              )),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.ellipsis),
                Text(
                  author,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
