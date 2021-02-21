import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class ListaNoticas extends StatelessWidget {
  const ListaNoticas({
    Key key,
    @required this.noticias,
  }) : super(key: key);

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(noticias[index].title);
      },
    );
  }
}
