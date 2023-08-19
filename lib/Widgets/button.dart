import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.color,
    required this.text_color,
  });
  final String text;
  final Color color;

  final Color text_color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 50,
        width: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )))

          /*ElevatedButton.styleFrom(
            
            backgroundColor: color, // Background color
          ),
          */
          ,
          child: Text(
            text,
            style: TextStyle(
              color: text_color,
            ),
          ),
        ),
      ),
    );
  }
}
