import 'package:flutter/material.dart';

import 'Widgets/image_slider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(children: [ImageSlider()]));
  }
}
