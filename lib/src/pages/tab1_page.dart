import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lita_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: ListaNoticas(noticias: newsService.headlines),
    );
  }
}
