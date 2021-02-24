import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/utils/utils.dart';
import 'package:newsapp/src/widgets/lita_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key key}) : super(key: key);

  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListCategory(),
            Expanded(
              child: ListaNoticas(
                noticias: newsService.getArticlesCategorySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categories[index];
          return _CategoryBotton(category: category);
        },
      ),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  const _CategoryBotton({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              final newsService =
                  Provider.of<NewsService>(context, listen: false);
              newsService.selectedCategory = category.name;
            },
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: newsService.selectedCategory == category.name
                    ? myTheme.accentColor
                    : Colors.white,
              ),
              child: Icon(
                category.icon,
                color: newsService.selectedCategory == category.name
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            capitalizeText(category.name),
            style: TextStyle(
              color: newsService.selectedCategory == category.name
                  ? myTheme.accentColor
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
