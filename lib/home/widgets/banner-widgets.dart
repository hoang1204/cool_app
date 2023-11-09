import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> imgPath = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgPath.length,
      itemBuilder: (BuildContext context, index, realIndex) {
        return Container(
          child: Image.asset(imgPath[index]),
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
      ),
    );
  }
}
