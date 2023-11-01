import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorPalette.pureWhite,
        boxShadow: [
          BoxShadow(
            color: ColorPalette.darkShadow,
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          )
        ],
      ),
      width: MediaQuery.sizeOf(context).width,
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              //TODO
            },
            child: const Icon(
              Icons.menu,
              color: ColorPalette.darkBlack,
              size: 30,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Home",
                style: TextStyle(
                  color: ColorPalette.darkBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: "Outfit",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
