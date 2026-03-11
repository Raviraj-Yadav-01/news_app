
import 'package:flutter/Material.dart';

import '../../../data/models/everything_model.dart';

class ExplorePage extends StatelessWidget {

  final ArticleModel1? article;

const ExplorePage({super.key, this.article});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),

      body:article == null
          ? Center(child: Text("No Article Selected"))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.network(article!.urlToImage),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              article!.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(article!.description),
          ),
        ],
      ),
    );
  }
}