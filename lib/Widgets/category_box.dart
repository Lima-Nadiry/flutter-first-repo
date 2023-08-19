import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.data,
    this.isActive = false,
    this.onTap,
    this.activeColor = Colors.blue,
    this.bgColor = Colors.white,
  }) : super(key: key);

  final data;

  final Color bgColor;
  final Color activeColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                color: isActive ? activeColor : bgColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withOpacity(0.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: const Offset(1, 1),
                  )
                ]),
            child: Row(
              children: [
                SvgPicture.asset(
                  data["icon"],
                  color: isActive ? Colors.white : Colors.blue,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  data["name"],
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.blue),
                )
              ],
            )),
      ),
    );
  }
}
