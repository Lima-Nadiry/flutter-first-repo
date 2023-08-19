import 'package:flutter/material.dart';

class RatingAndReview extends StatelessWidget {
  const RatingAndReview({
    Key? key,
    required this.data,
    required this.size,
  }) : super(key: key);

  final data;
  final size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange,
          size: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          data["rating"],
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          data["review"],
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
