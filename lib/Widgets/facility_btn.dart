import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacilityBtn extends StatelessWidget {
  const FacilityBtn({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 229, 239, 246),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.05),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(1, 1),
                )
              ]),
          child: SvgPicture.asset(
            data["icon"],
            color: Colors.blue,
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
