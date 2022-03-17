import 'package:eye_examination/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

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
  // FlashMode? _currentFlashMode;
  bool _flash = false;
  int timeCount = 0;

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
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

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

  // เริ่มถ่าย video => set ค่า _isRecordingInProgress = true

  // stop video

  // cameras index 0 , 1 => 0 backcamera, 1 front camera
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
                        children: [CameraPreview(_controller!)],
                      )),
                  Positioned(
                      child: Center(
                    child: Image.asset(
                      "assets/images/frame_eye.png",
                      width: 280,
                    ),
                  )),
                ],
              ),
            )
          : Container(),
    );
  }
}
