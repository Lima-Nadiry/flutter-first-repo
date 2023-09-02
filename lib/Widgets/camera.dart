import 'dart:math';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:khanagi_app/Widgets/camera_view.dart';
import 'package:khanagi_app/Widgets/video.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CameraPreview(_cameraController));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Positioned(
                bottom: 0.0,
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white30),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    flash = !flash;
                                  });
                                  flash
                                      ? _cameraController
                                          .setFlashMode(FlashMode.torch)
                                      : _cameraController
                                          .setFlashMode(FlashMode.off);
                                },
                                icon: Icon(
                                  flash ? Icons.flash_on : Icons.flash_off,
                                  color: Colors.white,
                                  size: 28,
                                )),
                          ),
                          GestureDetector(
                            onLongPress: () async {
                              await _cameraController.startVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                            },
                            onLongPressUp: () async {
                              XFile videopath =
                                  await _cameraController.stopVideoRecording();
                              setState(() {
                                isRecording = false;
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => VideoViewPage(
                                            path: videopath.path,
                                          )));
                            },
                            onTap: () {
                              if (!isRecording) takePhoto(context);
                            },
                            child: isRecording
                                ? const Icon(
                                    Icons.radio_button_on,
                                    color: Colors.red,
                                    size: 82,
                                  )
                                : const Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.blue,
                                    size: 82,
                                  ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white30),
                            child: IconButton(
                                onPressed: () async {
                                  setState(() {
                                    isCameraFront = !isCameraFront;
                                  });
                                  int cameraPos = isCameraFront ? 0 : 1;
                                  _cameraController = CameraController(
                                      cameras[cameraPos], ResolutionPreset.max);
                                  cameraValue = _cameraController.initialize();
                                },
                                icon: const Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 28,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: file.path,
                )));
  }
}
