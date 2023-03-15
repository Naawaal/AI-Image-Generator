import 'package:ai_image_generator/app/ui/pages/01_homepage/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiImageGenerator extends StatelessWidget {
  const AiImageGenerator({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Image Generator',
      themeMode: ThemeMode.system,
      home: const HomepageScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
