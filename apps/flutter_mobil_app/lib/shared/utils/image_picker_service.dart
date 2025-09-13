import 'package:feedbackdesign/uikit/roptia_ui_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

class ImagePickerService {
  static final ImagePicker _imagePicker = ImagePicker();

  // Define a callback type that returns both image file and base64 string
  static Future pickImage(
    void Function(File file, String base64) onImagePicked,
  ) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        final File pickedImageFile = File(pickedFile.path);

        final String fileExtension =
            path.extension(pickedImageFile.path).toLowerCase();
        final List<String> allowedExtensions = [
          '.jpg',
          '.jpeg',
          '.png',
          '.gif',
          '.bmp',
          '.webp',
        ];

        if (!allowedExtensions.contains(fileExtension)) {
          Toast.error("Please select a valid image file.");
          return;
        }

        // Try compressing with decreasing quality until size < 1 MB
        int quality = 100;
        Uint8List? compressedBytes;
        const int maxSizeInBytes = 1024 * 1024; // 1 MB

        while (quality >= 20) {
          compressedBytes = await FlutterImageCompress.compressWithFile(
            pickedImageFile.absolute.path,
            minWidth: 1024,
            minHeight: 1024,
            quality: quality,
          );

          if (compressedBytes != null &&
              compressedBytes.lengthInBytes <= maxSizeInBytes) {
            break;
          }

          quality -= 10;
        }

        if (compressedBytes == null ||
            compressedBytes.lengthInBytes > maxSizeInBytes) {
          Toast.error(
            "Failed to compress image below 1MB. Please try with a smaller image.",
          );
          return;
        }

        final String imageName = path.basename(pickedImageFile.path);

        // Determine MIME type
        String mimeType = 'image/jpeg'; // Default MIME type
        if (fileExtension == '.png') {
          mimeType = 'image/png';
        } else if (fileExtension == '.gif') {
          mimeType = 'image/gif';
        } else if (fileExtension == '.bmp') {
          mimeType = 'image/bmp';
        } else if (fileExtension == '.webp') {
          mimeType = 'image/webp';
        }
        // Ensure the name follows your format with a custom prefix and trailing brace
        final modifiedName =
            imageName.contains('scaled_')
                ? imageName.replaceFirst('scaled_', 'rop_')
                : 'rop_$imageName';

        // Construct base64 string in your expected format
        String imageBase64 =
            "data:$mimeType;base64,${base64Encode(compressedBytes)}$modifiedName}";

        // Call the provided callback with both file and base64 string
        onImagePicked(pickedImageFile, imageBase64);
      }
    } catch (_) {
      Toast.error("Failed to pick an image. Please try again.");
    }
  }
}
