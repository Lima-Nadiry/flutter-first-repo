import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/camera.dart';

import 'package:khanagi_app/message_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(home: MessagePage()));
}
