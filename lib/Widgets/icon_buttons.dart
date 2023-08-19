import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          color: Colors.black54,
          icon,
          size: 22,
        ),
      ),
    );
  }
}
