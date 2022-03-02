import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoSlider extends StatelessWidget {
  const PhotoSlider({
    required this.buttonCarouselController,
    required this.imgList,
    required this.isDark,
  });

  final CarouselController buttonCarouselController;
  final List imgList;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: 370,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
        items: imgList.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: PhotoView(
                    backgroundDecoration: BoxDecoration(
                        color: (isDark) ? Colors.black : Colors.white),
                    loadingBuilder: (context, loadingProgress) {
                      if (loadingProgress == null)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      print(error);
                      return Text('Some errors occurred!');
                    },
                    imageProvider: NetworkImage(url),
                    minScale: PhotoViewComputedScale.contained * 1.0,
                    maxScale: PhotoViewComputedScale.contained * 2.5,
                    initialScale: PhotoViewComputedScale.contained * 1.0,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
