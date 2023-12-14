import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  GridView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return GridView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        // mainAxisSpacing: ,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 5,
      ),
      children: [
        for (var webtoon in snapshot.data!)
          Webtoon(
            title: webtoon.title,
            thumb: webtoon.thumb,
            id: webtoon.id,
          )
      ],
    );
    // return ListView.separated(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: snapshot.data!.length,
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 15,
    //     horizontal: 20,
    //   ),
    //   itemBuilder: (context, index) {
    //     var webtoon = snapshot.data![index];
    //     return Webtoon(
    //         title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
    //   },
    //   separatorBuilder: (context, index) => const SizedBox(
    //     width: 40,
    //   ),
    // );
  }
}
