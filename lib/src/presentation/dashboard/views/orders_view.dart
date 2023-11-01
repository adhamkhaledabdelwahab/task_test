import 'package:flutter/cupertino.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/images.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 296,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              MyImages.imgEmptyState,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "No orders found",
            style: TextStyle(
              fontSize: 22,
              fontFamily: "Outfit",
              fontWeight: FontWeight.w700,
              color: ColorPalette.achromatic800,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "you can place your needed orders to let serve you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Outfit",
              fontWeight: FontWeight.w300,
              color: ColorPalette.achromatic500,
            ),
          ),
        ],
      ),
    );
  }
}
