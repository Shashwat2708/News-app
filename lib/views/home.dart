import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/article_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                tittle: articles[index].title,
                                desc: articles[index].description);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, tittle, desc;
  BlogTile({required this.imageUrl, required this.tittle, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: imageUrl),
          Text(
            tittle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(desc)
        ],
      ),
    );
  }
}
