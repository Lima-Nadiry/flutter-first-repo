import 'package:flutter/material.dart';
import 'package:khanagi_app/data.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 65,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 239, 246),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.05),
                spreadRadius: .5,
                blurRadius: .5,
                offset: Offset(1, 1),
              )
            ]),
        child: Center(
          child: Text(
            data,
            style: TextStyle(
              fontSize: 10,
              color: Colors.blue,
            ),
          ),
        ));
  }
}
