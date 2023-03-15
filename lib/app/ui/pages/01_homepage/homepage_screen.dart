import 'package:ai_image_generator/app/data/services/api/api_services.dart';
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
  var values = ["256x256", "512x512", "1024x1024"];
  String? dropValue;
  String image = '';
  var isLoaded = false;

  var textController = TextEditingController();
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
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: textController,
                            decoration: const InputDecoration(
                              hintText: "eg 'lion on a champ' ",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 50,
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
                            value: dropValue,
                            hint: const Text("Select Size"),
                            items: List.generate(
                              sizes.length,
                              (index) => DropdownMenuItem(
                                value: values[index],
                                child: Text(
                                  sizes[index],
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                dropValue = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (textController.text.isNotEmpty &&
                            dropValue!.isNotEmpty) {
                          setState(() {
                            isLoaded = false;
                          });
                          image = await Api.generateImage(
                              textController.text, dropValue!);
                          setState(() {
                            isLoaded = true;
                          });
                        } else {
                          Get.snackbar(
                            "Invalid Promot",
                            "please enter valid text and select sized",
                            colorText: whiteColor,
                          );
                        }
                      },
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
              child: isLoaded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(image, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                child: const Text("Download"),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                child: const Text("Share"),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/loader.gif"),
                          const Text(
                            "Waiting for image to be generated",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
