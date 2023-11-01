import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/presentation/dashboard/views/slider_item_view.dart';

class SliderView extends StatelessWidget {
  const SliderView({
    super.key,
    required this.controller,
    required this.sliderNotifier,
    required this.length,
  });

  final PageController controller;
  final int length;
  final ValueNotifier<int> sliderNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: sliderNotifier,
      builder: (context, sliderValue, child) {
        return Container(
          color: ColorPalette.bgColor,
          height: 152,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (pos) {
                    sliderNotifier.value = pos;
                  },
                  itemCount: length,
                  itemBuilder: (context, index) => const SliderItemView(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  length,
                  (index) => AnimatedContainer(
                    margin: index != length - 1
                        ? const EdgeInsets.only(right: 4)
                        : null,
                    width: sliderValue == index ? 32 : 8,
                    height: 8,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(360),
                      color: sliderValue == index
                          ? ColorPalette.primaryColor
                          : ColorPalette.achromatic100,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
