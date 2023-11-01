import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/icons.dart';
import 'package:task_test/src/data/model/category_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories View",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  color: ColorPalette.darkBlack,
                ),
              ),
              InkWell(
                onTap: () {
                  //TODO
                },
                child: const Text(
                  "see all",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w300,
                    color: ColorPalette.achromatic400Icons,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: ColorPalette.pureWhite,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                    color: ColorPalette.darkShadow,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    categories[index].icon,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Outfit",
                      fontSize: 16,
                      color: ColorPalette.brightBlack,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    MyIcons.icArrowForward,
                  )
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: categories.length,
        ),
      ],
    );
  }
}
