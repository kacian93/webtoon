import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({Key? key,required this.webtoonId, required this.episode}) : super(key: key);

  final WebtoonEpisodeModel episode;
  final String webtoonId;
  onButtonTap() async {

    final url = Uri.parse("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  episode.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          )),
    );
  }
}
