import 'package:ai_image_generator/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  var sizes = ["Small", "Medium", "Large"];
  var value = ["256x256", "512x512", "1024x1024"];
  String? dropValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AI Image Generator",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "eg 'lion on a champ' ",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: const Icon(Icons.expand_circle_down_outlined,
                                color: btnColor),
                            hint: const Text("Select Size"),
                            items: List.generate(
                              sizes.length,
                              (index) => DropdownMenuItem(
                                value: value[index],
                                child: Text(
                                  sizes[index],
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Generate",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
