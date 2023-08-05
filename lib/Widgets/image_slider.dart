import 'package:flutter/material.dart';

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
    "images/image4.jpg",
    "images/image5.jpg",
    "images/image6.jpg",

    // Add more images as needed
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: 600,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(images[index]),
            )),
            child: Container(
                child: Column(children: [
              /*   List.generate(3, (indexDots){
              return  Container(
                margin: const EdgeInsets.only(bottom: 2),
                  width: 8,
                  height: index==indexDots?25:8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index== indexDots?Colors.blue:Colors.grey,
                  ),
                ),
            })
            ,
            */
            ])),
          );
        });
  }
}
