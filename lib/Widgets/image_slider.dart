import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/favoriteButton.dart';

import 'shareButton.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> images = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",

    // Addmore images as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(
        child: SizedBox(
          height: 400,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (_, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      images[index],
                    ),
                  )),
                  child: Container(
                      margin: const EdgeInsets.only(
                          top: 350, left: 150, right: 150),
                      child: Row(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(right: 2, left: 2),
                            width: 15,
                            height: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.blue
                                    : Colors.white),
                          );
                        }),
                      )),
                );
              }),
        ),
      ),
      const Positioned(
          right: 27,
          top: 20,
          child: Row(
            children: [FaviorateButton(), ShareButton()],
          ))
    ]);
  }
}
