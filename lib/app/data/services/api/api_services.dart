import 'dart:convert';

import 'package:ai_image_generator/app/data/services/api/api_key.dart';
import 'package:ai_image_generator/app/ui/theme/color_const.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Api {
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");

  static final headrs = {
    "Content-Type": "application/json",
    "Authorization": 'Bearer $apiKey',
  };

  static generateImage(String test, String size) async {
    var res = await http.post(
      url,
      headers: headrs,
      body: jsonEncode({"prompt": test, "n": 1, "size": size}),
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      return data['data'][0]['url'].toString();
    } else {
      Get.snackbar("Error", "failed to fetch image", colorText: whiteColor);
    }
  }
}
