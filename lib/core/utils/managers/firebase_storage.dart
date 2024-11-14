import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class FirebaseStorageManager {
  Future<Uint8List> getImageDataFromAssets(String path);
  Future<String> uploadImageData(String path, Uint8List image, String name);
  Future<String> uploadImageFile(String path, XFile image);
}

class FirebaseStorageManagerImp implements FirebaseStorageManager {
  final _firebaseStorage = FirebaseStorage.instance;

  // Upload local assets
  @override
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      return imageData;
    } catch (e) {
      throw 'Error loading image data';
    }
  }

  // Upload image using imageData on Cloud Firebase storage
  @override
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    final ref = _firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url = await ref.getDownloadURL();
    return url;
  }

  // Upload image on cloud firebase storage
  @override
  Future<String> uploadImageFile(String path, XFile image) async {
    final ref = _firebaseStorage.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }
}
