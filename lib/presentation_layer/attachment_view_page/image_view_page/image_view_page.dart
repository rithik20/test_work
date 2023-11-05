import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String? imagePath;

  const ImageViewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back));
        }),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.file(File(imagePath!), fit: BoxFit.contain,)),
    );
  }
}
