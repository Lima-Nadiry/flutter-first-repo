import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  const BookMark({
    super.key,
  });

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  bool outline = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          outline ? Icons.favorite : Icons.favorite_outline,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          setState(() {
            outline = !outline;
          });
        });
  }
}
