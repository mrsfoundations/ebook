import 'package:flutter/material.dart';
import 'package:ebook/widgets/books_item.dart';
import '../utils/enums.dart';
import '../widgets/background_widget.dart';

class BooksScreen extends StatefulWidget {
  CategoryName categoryName;
  BooksScreen( this.categoryName);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundWidget(),
        GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.45,
                crossAxisSpacing: 2,
                mainAxisSpacing: 1),
            itemBuilder: (ctx, index) {
              return BooksItem(
                category: widget.categoryName, id: '01', title: 'hi', author: 'i AM', url: 'https://github.com/mrsfoundations',
                // id: widget.bookslist[index]['id'],
                // title: widget.bookslist[index]['title'],
                // author: widget.bookslist[index]['author']['name'],
                // url: widget.bookslist[index]['link'][1]['-href'],
              );
            }),
      ],
    );
  }
}
