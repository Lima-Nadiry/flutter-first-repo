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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: visibleImageCount + 1, // Add 1 for the button
      itemBuilder: (context, index) {
        if (index < visibleImageCount) {
          // Show visible images
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Image.asset(images[index]),
          );
        } else {
          // Show button to display remaining images
          return GestureDetector(
            onTap: () {
              setState(() {
                visibleImageCount = images.length; // Show all images
              });
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              color: Colors.grey,
              child: Center(
                child: Text(
                  '+${images.length - visibleImageCount}',
                  style: TextStyle(
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
    );
  }
}
