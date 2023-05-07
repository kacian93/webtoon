import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          "Today's toons",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length);
          } else {
            return
              Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
