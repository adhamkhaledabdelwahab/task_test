import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/icons.dart';
import 'package:task_test/src/core/consts/images.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.bgColor,
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  MyImages.imgAvatar,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "Hey, Ahmed",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorPalette.darkBlack,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Image.asset(
                MyIcons.icPray,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Multi-Services for Your Real Estate Needs",
                  style: TextStyle(
                    fontSize: 18,
                    color: ColorPalette.darkBlack,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Outfit",
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Explore diverse real estate services for all your needs: property management, construction, insurance and more in one place.",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: ColorPalette.achromatic500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
