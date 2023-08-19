import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/favoriteButton.dart';

class homeWidget extends StatelessWidget {
  const homeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          width: 250,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage("images/apartment.jpeg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            right: 27,
            top: 20,
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 18,
                ),
                Text(
                  "4.8",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                SizedBox(
                  width: 10,
                )
              ]),
            )),
        Positioned(
          bottom: 7,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Modernica Apartment...",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "New York, US",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text(
                  "29",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "/ night",
                  style: TextStyle(color: Colors.white),
                )
              ])
            ],
          ),
        ),
        Positioned(bottom: 10, right: 10, child: FaviorateButton())
      ]),
    );
  }
}
