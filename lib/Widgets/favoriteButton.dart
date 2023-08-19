import 'package:flutter/material.dart';

class FaviorateButton extends StatefulWidget {
  const FaviorateButton({
    super.key,
  });

  @override
  State<FaviorateButton> createState() => _FaviorateButton();
}

class _FaviorateButton extends State<FaviorateButton> {
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
