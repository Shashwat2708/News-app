class ArticleModel {
  late String author;
  String title;
  String description;
  String url;
  String urlToImage;
  late String content;

  ArticleModel({
    //required this.author,
    required this.title,
    //required this.content,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
}
