import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({
    super.key,
  });

  @override
  State<ShareButton> createState() => _ShareButton();
}

class _ShareButton extends State<ShareButton> {
  bool outline = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          outline ? Icons.share : Icons.share_outlined,
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
