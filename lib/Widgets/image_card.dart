import 'package:flutter/material.dart';
import 'package:khanagi_app/detail_page.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage()));
        //MaterialPageRoute(builder: (context) => const DetailPage());
        //Navigator.pushNamed(context, '/secondPage');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 4.0,
                  spreadRadius: .05)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(children: [
                Container(
                  height: 100,
                  width: (MediaQuery.of(context).size.width) * 2,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      data["img"],
                      // "images/profile.jpg",
                    ),
                  ),
                ),
                Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      height: 20,
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
                          size: 13,
                        ),
                        Text(
                          data["rating"],
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ]),
                    ))
              ]),
              /* alignment: Alignment.topRight,
              child: Image.asset(
                data["img"],
                height: 120.0,
              ),
              */
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              data["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              data["location"],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  data["price"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue),
                ),
                Text(
                  data["duration"],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
