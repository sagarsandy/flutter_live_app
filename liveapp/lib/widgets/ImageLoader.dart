import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Image.network(
          "https://loremflickr.com/cache/resized/65535_49816709832_c9df27e040_320_240_nofilter.jpg"),
    );
  }
}
