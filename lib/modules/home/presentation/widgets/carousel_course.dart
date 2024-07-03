import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../screens/elementlist/imagelist.dart';

class CarouselCourse extends StatelessWidget {
  const CarouselCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
        height: 230,
        itemCount: announcelist.length,
        viewportFraction: 0.9999,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            announcelist[index],
            fit: BoxFit.fill,
          )
              .box
              .rounded
              .clip(Clip.antiAlias)
              .margin(const EdgeInsets.symmetric(horizontal: 10))
              .make();
        });
  }
}
