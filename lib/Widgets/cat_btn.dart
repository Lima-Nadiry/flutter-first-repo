import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 65,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 229, 239, 246),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.05),
                spreadRadius: .5,
                blurRadius: .5,
                offset: const Offset(1, 1),
              )
            ]),
        child: Center(
          child: Text(
            data,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.blue,
            ),
          ),
        ));
  }
}
