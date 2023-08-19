import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/cat_btn.dart';
import 'package:khanagi_app/Widgets/facilities_box.dart';
import 'package:khanagi_app/Widgets/rating_plus_review..dart';
import 'Widgets/button.dart';
import 'Widgets/image_list.dart';
import 'Widgets/image_slider.dart';
import 'data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Expanded(
        child: SizedBox(
          // height: double.maxFinite,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ImageSlider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    itemCard[0]["name"],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(children: [
                    CategoryButton(
                      onTap: null,
                      data: categories[3]["name"],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RatingAndReview(
                      data: itemCard[0],
                      size: 10.0,
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 10,
                  color: Color.fromARGB(255, 217, 221, 221),
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/female.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Natasya Wilodra",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Owner",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.message_rounded,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                    ])),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "Overview",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    itemCard[0]["description"],
                    style: const TextStyle(fontSize: 14, color: Colors.black38),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "Facilities",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const FacilityBox(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                        ])),
                ImageList(),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "Location",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                      ),
                      Text(
                        "Grand City St, 100, New York, United States",
                        style: TextStyle(fontSize: 14, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 200,
                      width: 350,
                      margin: const EdgeInsets.all(8.0),
                      // child: Image.asset(images[index]),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage("images/location.jpg"),
                              fit: BoxFit.cover)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingAndReview(
                          data: itemCard[0],
                          size: 18.0,
                        ),
                        const Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 10,
                  color: Color.fromARGB(255, 217, 221, 221),
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    itemCard[0]["price"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    itemCard[0]["duration"],
                                  ),
                                ],
                              )
                            ]),
                        const Spacer(),
                        const Button(
                          color: Colors.red,
                          text: 'Booking Now',
                          text_color: Colors.white,
                        )
                      ],
                    ))
              ]),
        ),
      ),
    ));
  }
}
