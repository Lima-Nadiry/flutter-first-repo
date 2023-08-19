import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/facility_btn.dart';
import 'package:khanagi_app/data.dart';

class FacilityBox extends StatelessWidget {
  const FacilityBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 24),
      itemBuilder: (context, index) {
        return FacilityBtn(data: facility[index]);
      },
    );
  }
}
