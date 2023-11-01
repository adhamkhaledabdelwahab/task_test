import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/images.dart';

class SliderItemView extends StatelessWidget {
  const SliderItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 9,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Multi-Services for Your Real Estate Needs",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit",
                      color: ColorPalette.darkBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 128,
                    height: 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                      ),
                      onPressed: () {
                        //TODO
                      },
                      child: const Text(
                        "Order",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorPalette.pureWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              MyImages.imgSlider,
            ),
          ),
        ],
      ),
    );
  }
}
