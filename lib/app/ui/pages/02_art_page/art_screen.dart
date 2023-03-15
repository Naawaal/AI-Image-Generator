import 'dart:io';

import 'package:ai_image_generator/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key});

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  List imgList = [];
  getImages() async {
    final directory = Directory("storage/emulated/0/AI Image");
    imgList = directory.listSync();
  }

  popImg(filepath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.file(
              filepath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AI Image Collection",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                popImg(imgList[index]);
              },
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.file(imgList[index])),
            );
          },
        ),
      ),
    );
  }
}
