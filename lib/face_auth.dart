// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class FaceAuthenticationButton extends StatelessWidget {
  const FaceAuthenticationButton({super.key});

  Future<void> _authenticateWithFace(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageFile =
          await picker.pickImage(source: ImageSource.camera);

      if (imageFile == null) {
        print('Image selection canceled by the user.');
        return;
      }

      final GoogleVisionImage visionImage =
          GoogleVisionImage.fromFilePath(imageFile.path);
      final FaceDetector faceDetector = GoogleVision.instance.faceDetector();
      final List<Face> faces = await faceDetector.processImage(visionImage);

      if (faces.isNotEmpty) {
        print('Face recognized successfully!');
      } else {
        print('No face detected in the image.');
      }
    } catch (e) {
      print('Error during face authentication: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _authenticateWithFace(context),
      child: const Text('Authenticate with Face Recognition'),
    );
  }
}
