import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eye_examination/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dry_eye.dart';

final List _generateList = [];

class DryBlinkTest extends StatefulWidget {
  static const routeName = '/return';
  @override
  State<DryBlinkTest> createState() => _DryBlinkTestState();
}

class _DryBlinkTestState extends State<DryBlinkTest>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.medium;
  int timeCount = 0;
  bool _isRecordingInProgress = false;
  final storage = FirebaseStorage.instance;
  int timeOut = 5;

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;
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
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (controller!.value.isRecordingVideo) {
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
    if (!controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }
    try {
      print("stop record");
      XFile file = await controller!.stopVideoRecording();
      if (file == null) {
        return null;
      }
      setState(() {
        _isRecordingInProgress = false;
        // print(_isRecordingInProgress);
      });
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  _uploadBlinkAndTime(File filePath) {
    // upload Blink
    if (colorList[0] == Colors.white) {
      print("First time");
      _uploadForBlink(filePath);
      colorList[0] = Colors.grey;
      Navigator.popAndPushNamed(
        context,
        DryBlinkTest.routeName,
        arguments: {
          "_pageList": "1",
        },
      );
    }
    // upload Time
    else if (colorList[0] == Colors.grey) {
      print("second time");
      _uploadForTime(filePath);
      colorList[1] = Colors.grey;
      Navigator.popAndPushNamed(context, DryBlinkTest.routeName, arguments: {
        "_pageList": "2",
        "keyBlink": _generateList[0],
        "keyTime": _generateList[1],
      });
    }
  }

  Future _settimeAndRecord() async {
    final Timer _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        setState(() {
          timeOut -= 1;
        });
        if (timeOut == 0) {
          timer.cancel();
          if (_isRecordingInProgress) {
            print("stop record . . .");
            XFile? rawVideo = await _stopVideoRecording();
            File filePath = File(rawVideo!.path);
            _uploadBlinkAndTime(filePath);
          }
        }
      },
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    onNewCameraSelected(cameras[1]);
    super.initState();
  }

  // release memory when not active
  final Random _rnd = Random();
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future _uploadForBlink(File filePath) async {
    const url = "https://my-app-vkvof.ondigitalocean.app/eyeblink";
    final String _generate = getRandomString(12);
    _generateList.add(_generate);
    print("generalList $_generateList"); // ชื่อไฟลื
    final destination = "blink_$_generate"; // path ที่จะใส่ลง
    final ref = FirebaseStorage.instance.ref(destination);
    UploadTask uploadTask = ref.putFile(filePath);
    print("upload ... ");
    final uploadUrl = await (await uploadTask).ref.getDownloadURL();
    print("real URL $uploadUrl");
    final parsedData = Uri.encodeComponent(uploadUrl);
    print("encode URL :$parsedData");

    final response = await http.post(
      Uri.parse(url + "?url=" + parsedData),
      headers: <String, String>{'Content-Type': 'application/json'}, // metra
      body: jsonEncode({"key": _generate}),
    );

    if (response.statusCode == 200) {
      print("Success ${response.statusCode}");
    } else {
      print("not send post ${response.body}");
    }
  }

  Future _uploadForTime(
    File filePath,
  ) async {
    const url = "https://my-app-vkvof.ondigitalocean.app/blinkduration";
    final String _generate = getRandomString(12);
    _generateList.add(_generate);
    print(_generateList); // ชื่อไฟลื
    final destination = "Time_$_generate"; // path ที่จะใส่ลง
    final ref = FirebaseStorage.instance.ref(destination);
    UploadTask uploadTask = ref.putFile(filePath);
    print("upload duration ... ");
    final uploadUrl = await (await uploadTask).ref.getDownloadURL();
    final parsedData = Uri.encodeComponent(uploadUrl);
    print("URL : $parsedData");
    final response = await http.post(
      Uri.parse(url + "?url=" + parsedData),
      headers: <String, String>{'Content-Type': 'application/json'}, // meta
      body: jsonEncode({"key": _generate}),
    );

    if (response.statusCode == 200) {
      print("Success ${response.statusCode}");
    } else {
      print("not send post ${response.body}");
    }
  }

  @override
  void dispose() {
    controller?.dispose();
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
                    aspectRatio: 1 / controller!.value.aspectRatio,
                    child: Stack(
                      children: [
                        controller!.buildPreview(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 35, horizontal: 25),
                          child: Text(
                            timeOut.toString(),
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
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
                                    } else {
                                      _settimeAndRecord();
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
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
