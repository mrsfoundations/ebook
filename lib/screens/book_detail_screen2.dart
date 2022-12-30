import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ebook/utils/enums.dart';
import 'package:epub_viewer/epub_viewer.dart';

class BookDetailsScreen2 extends StatefulWidget {
  static String routeName = '/details-screen2';

  const BookDetailsScreen2({Key? key}) : super(key: key);

  @override
  State<BookDetailsScreen2> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen2> {
  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String id = args['id'].toString();

    CategoryName category = args['categoryname'] as CategoryName;
    List<dynamic> bookdetails = [];

    String epubUrl = bookdetails[0]['link'][3]['-href'];
    String imageUrl = bookdetails[0]['link'][1]['-href'];

    String title = bookdetails[0]['title'];
    String author = bookdetails[0]['author']['name'];
    String description = bookdetails[0]['summary'];
    String publicationdate = bookdetails[0]['dcterms:issued'].toString();

    void downloadEpub(String url, String filename)
    async {
      print('a');
    }

    void openEpub(value) {
      if (value.isDownloaded) {
        EpubViewer.setConfig(
          identifier: 'androidBook',
          themeColor: Theme.of(context).colorScheme.secondary,
          scrollDirection: EpubScrollDirection.VERTICAL,
          enableTts: false,
          allowSharing: true,
        );
        EpubViewer.open(value.bookPath, lastLocation: null);
      }
    }

    Widget readDownloadButton() {
      return Consumer(
        builder: (context, value, child)=>
            ElevatedButton(
          onPressed: () {
            downloadEpub(epubUrl, title);
          },
          child: const Text(
            'Download',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.black12)),
                            width: MediaQuery.of(context).size.width * .35,
                            child: Image.network('https://picsum.photos/250?image=9'),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .50,
                              child: Text(title,
                                  maxLines: 10,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(author),
                            Text(publicationdate),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .60,
                    child: readDownloadButton(),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.orange,
                    ))
              ],
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
              child: Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                description,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
