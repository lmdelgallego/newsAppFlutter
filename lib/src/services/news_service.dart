import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '80af870410884d14822a46eb883d66a5';

class NewsService with ChangeNotifier {
  String _selectedCategory = 'business';

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideCough, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = new List();
    });
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].isNotEmpty) {
      return this.categoryArticles[category];
    }

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=$category';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }

  List<Article> get getArticlesCategorySelected =>
      this.categoryArticles[this.selectedCategory];
}
