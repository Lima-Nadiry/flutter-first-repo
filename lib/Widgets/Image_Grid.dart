import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/image_card.dart';
import 'package:khanagi_app/data.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCard.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 24),
      itemBuilder: (context, index) {
        return ImageCard(data: itemCard[index]);
      },
    );
  }
}
