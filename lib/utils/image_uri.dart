import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ImageUriParser {



  static Future<Uri> getImageFileFromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final buffer = byteData.buffer;
    Directory tempDir =  await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;
    var filePath =
        '$tempPath/file_01.png'; // file_01.tmp is dump file, can be anything
    return (await File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
        .uri;
  }
}