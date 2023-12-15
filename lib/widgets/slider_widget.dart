import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.bannerList,
  });

  final List bannerList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        height: 400,
        viewportFraction: 1.0,
      ),
      items: bannerList.map(
        (bannerImage) {
          return Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  bannerImage.thumb,
                  headers: const {
                    'Referer': 'https://comic.naver.com',
                  },
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
