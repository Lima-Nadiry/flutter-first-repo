import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<String> images = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.jpg",
    "images/image4.jpg",
    "images/image5.jpg",
    "images/image6.jpg",

    // Add more images as needed
  ];
  int visibleImageCount = 4; // Number of initially visible images

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: visibleImageCount + 1, // Add 1 for the button
        itemBuilder: (context, index) {
          if (index < visibleImageCount) {
            // Show visible images
            return Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.all(8.0),
              // child: Image.asset(images[index]),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
            );
          } else {
            // Show button to display remaining images
            return GestureDetector(
              onTap: () {
                setState(() {
                  visibleImageCount = images.length - 1; // Show all images
                });
              },
              child: Container(
                height: 120,
                width: 120,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage(images[images.length - 1]),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    '+${images.length - visibleImageCount - 1}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
