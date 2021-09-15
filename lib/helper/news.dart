import 'dart:convert';

import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1a9186b5ab31435cbf5cfe88a9a419e8");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            description: element['description'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}


//1a9186b5ab31435cbf5cfe88a9a419e8