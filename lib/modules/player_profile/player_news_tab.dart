import 'package:fanzhashem/models/player_profile/news_model.dart';
import 'package:flutter/material.dart';

class PlayerNewsTab extends StatelessWidget {
  final List<NewsModel> playerNews;
  const PlayerNewsTab({required this.playerNews, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemCount: playerNews.length,
        itemBuilder: (BuildContext context, int index) {
          return newsTabWidget(
            playerNews[index].title,
            playerNews[index].image,
            height,
          );
        },
      ),
    );
  }

  Widget newsTabWidget(String title, String img, double height) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 16),
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                // image: AssetImage('${assetImageBaseUrl}ground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
