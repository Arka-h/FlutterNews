import 'dart:convert';

import 'package:flutter_learn/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=ee4c8179177e470789cff7b82e951425';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null ||
            element['description'] !=
                null) //bug fix, ignores the articles without urlToImage, description
        {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            context: element['context'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ee4c8179177e470789cff7b82e951425';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null ||
            element['description'] !=
                null) //bug fix, ignores the articles without urlToImage, description
        {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            context: element['context'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
