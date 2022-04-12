import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_examination/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DryBlinkTest extends StatefulWidget {
  @override
  State<DryBlinkTest> createState() => _DryBlinkTestState();
}

class _DryBlinkTestState extends State<DryBlinkTest>
    with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;
  int timeCount = 0;
  bool _isRecordingInProgress = false;
  final storage = FirebaseStorage.instance;

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    print(state);

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = _controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
        cameraDescription, currentResolutionPreset,
        imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);

    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize contaoller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = _controller;

    if (_controller!.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      _isRecordingInProgress = true;
    } on Exception catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> _stopVideoRecording() async {
    if (!_controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }
    try {
      XFile file = await _controller!.stopVideoRecording();
      if (file == null) {
        return null;
      }
      setState(() {
        _isRecordingInProgress = false;
        print(_isRecordingInProgress);
      });
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    onNewCameraSelected(cameras[0]);
    super.initState();
  }

  // release memory when not active
  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  Future uploadFile(File file, String nameFile) async {
    final fileName = nameFile;
    final destination = 'files/$fileName';
    final ref = FirebaseStorage.instance.ref(destination);
    return ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _isCameraInitialized
          ? Scaffold(
              body: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / _controller!.value.aspectRatio,
                    child: Stack(
                      children: [
                        CameraPreview(_controller!),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(5.0)),
                              width: size.width,
                              height: size.height * 0.08,
                              child: IconButton(
                                  onPressed: () async {
                                    if (_isRecordingInProgress) {
                                      XFile? rawVideo =
                                          await _stopVideoRecording();
                                      File filePath = File(rawVideo!.path);
                                      // print(rawVideo);
                                      // print(filePath);
                                      // print(rawVideo.name);

                                      uploadFile(filePath, rawVideo.name);
                                    } else {
                                      await startVideoRecording();
                                    }
                                  },
                                  icon: _isRecordingInProgress
                                      ? const Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 45,
                                        )
                                      : const Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 45,
                                        )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
