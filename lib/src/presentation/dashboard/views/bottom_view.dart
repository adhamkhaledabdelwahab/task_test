import 'package:flutter/material.dart';
import 'package:task_test/src/core/consts/color_palette.dart';

class BottomView extends StatelessWidget {
  const BottomView({
    super.key,
    required this.tabs,
    required this.tabNotifier,
    required this.tabsView,
  });

  final List<Widget> tabsView;
  final List<String> tabs;
  final ValueNotifier<int> tabNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tabNotifier,
      builder: (context, tabValue, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    tabs.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: index < tabs.length - 1 ? 8 : 0,
                      ),
                      child: Material(
                        color: index == tabValue
                            ? ColorPalette.primaryColor
                            : ColorPalette.achromatic50,
                        borderRadius: BorderRadius.circular(360),
                        child: InkWell(
                          onTap: () {
                            tabNotifier.value = index;
                          },
                          child: SizedBox(
                            width: 96,
                            height: 30,
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Outfit",
                                  fontSize: 14,
                                  color: index == tabValue
                                      ? ColorPalette.achromatic50
                                      : ColorPalette.darkBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              tabsView[tabValue],
            ],
          ),
        );
      },
    );
  }
}
