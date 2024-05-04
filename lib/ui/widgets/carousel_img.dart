import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImg extends StatefulWidget {
  const CarouselImg({super.key, required this.images});
  final List<String> images;

  @override
  State<CarouselImg> createState() => _CarouselImgState();
}

class _CarouselImgState extends State<CarouselImg> {
  static const double _height = 260;
  static const double _aspectRatio = 16 / 9;
  static const double _viewportFraction = 0.8;

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: _height,
                enlargeCenterPage: true,
                autoPlay: widget.images.length > 1,
                aspectRatio: _aspectRatio,
                // autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                viewportFraction: _viewportFraction,
                onPageChanged: (value, _) {
                  setState(() {
                    _currentPage = value;
                  });
                }),
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              final imageUrl = widget.images[index];
              return Container(
                // width: 200,
                // height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          buildCarouselIndicator(),
        ],
      ),
    );
  }

  buildCarouselIndicator() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < widget.images.length; i++)
            Container(
              margin: const EdgeInsets.all(5),
              height: i == _currentPage ? 10 : 5,
              width: i == _currentPage ? 10 : 5,
              decoration: BoxDecoration(
                color: i == _currentPage ? Colors.white : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
