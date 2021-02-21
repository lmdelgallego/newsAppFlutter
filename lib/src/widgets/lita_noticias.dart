import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

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
        return Column(
          children: [
            _TerjetaTopBar(noticia: noticias[index], index: index),
            _TarjetaTitulo(noticia: noticias[index]),
            Container(
              child: Text('Hola Mundo'),
            ),
          ],
        );
      },
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({
    Key key,
    @required this.noticia,
  }) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TerjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TerjetaTopBar({Key key, @required this.noticia, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}.', style: TextStyle(color: myTheme.accentColor)),
          Text('${noticia.source.name}.'),
        ],
      ),
    );
  }
}
