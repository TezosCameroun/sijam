import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

//This function is used to look at the file type of what the user has selected. Only Images are supported for now
bool isImage(String path) {
  final mimeType = lookupMimeType(path);

  return mimeType?.startsWith('image/') as bool;
}

//This function selects the image
Future<File?> pickImages(int imageSource, BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  File? compressedFile;
  if (imageSource == 0) {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      imageFile = File(pickedFile?.path as String);
      final bytes = imageFile.readAsBytesSync().lengthInBytes;

      compressedFile = await ReduceImageQualityAndSize(imageFile);
    } catch (e, s) {
      // logHandledException(e, s);
      // showToastMessage(e.toString());
    }
  } else {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      imageFile = File(pickedFile?.path as String);
      compressedFile = await ReduceImageQualityAndSize(imageFile);
    } catch (e, s) {
      // logHandledException(e, s);
      // showToastMessage(e.toString());
    }
  }
  return compressedFile;
}

//This function gets a file and compresses it to  1.5mb or size less than
Future ReduceImageQualityAndSize(File imageFile) async {
  const maxSize = 1.5;
  int quality = 100;
  File? compressedFile;
  final bytes = imageFile.readAsBytesSync().lengthInBytes;
  var imageSizeInMb = getImagesizeInMb(bytes);

  while (imageSizeInMb > maxSize) {
    // reduce image size about 10% of image, until the size is less than the maximum limit
    quality = (quality - (quality * 0.1)).toInt();
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(imageFile.path);

    compressedFile = await FlutterNativeImage.compressImage(imageFile.path,
        quality: 100, targetWidth: 1000, targetHeight: 1000);

    imageFile = File(compressedFile?.path as String);
    final compressedInBytes = imageFile.readAsBytesSync().lengthInBytes;

    imageSizeInMb = getImagesizeInMb(compressedInBytes);
  }

  return compressedFile;
}

getImagesizeInMb(compressedInBytes) {
  final compressedInkb = compressedInBytes / 1024;
  final compressedInMb = compressedInkb / 1024;
  return compressedInMb;
}
