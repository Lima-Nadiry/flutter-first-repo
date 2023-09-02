import 'package:flutter/material.dart';

class AttachmentPopUp extends StatelessWidget {
  const AttachmentPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    List PopUp = [
      {
        "text": "Document",
        "icon": Icons.insert_drive_file,
        "color": Colors.blue
      },
      {"text": "Camera", "icon": Icons.camera_alt, "color": Colors.pink},
      {"text": "Gallary", "icon": Icons.insert_photo, "color": Colors.orange},
      {"text": "Audio", "icon": Icons.headset, "color": Colors.purpleAccent},
      {
        "text": "Location",
        "icon": Icons.location_pin,
        "color": Colors.greenAccent
      },
      {"text": "Contact", "icon": Icons.person, "color": Colors.purple},
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 30,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return PopUpIcon(data: PopUp[index]);
        },
      ),
    );
  }
}

class PopUpIcon extends StatelessWidget {
  const PopUpIcon({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: data["color"],
          child: Icon(
            data["icon"],
            size: 29,
            color: Colors.white,
          ),
        ),
        Text(
          data["text"],
        )
      ],
    );
  }
}
