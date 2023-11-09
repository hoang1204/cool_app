import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class ImageResized extends StatelessWidget {
  const ImageResized({super.key,required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    // Đường dẫn của hình ảnh từ mạng
    String imageUrl = 'https://example.com/your_image.jpg';

// Kích thước mới cho ảnh
    int newWidth = 200;
    int newHeight = 200;

// Tải và thay đổi kích thước của ảnh
    img.Image? image = img.decodeImage(Uint8List.fromList([]));
    if (image != null) {
      img.Image resizedImage =
          img.copyResize(image, width: newWidth, height: newHeight);
      Uint8List resizedImageData =
          Uint8List.fromList(img.encodePng(resizedImage));

      // Hiển thị ảnh sau khi đã thay đổi kích thước
      return Image.memory(resizedImageData);
    }
    return Container();
  }
}
