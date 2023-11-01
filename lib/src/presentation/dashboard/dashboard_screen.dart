import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_test/src/core/consts/color_palette.dart';
import 'package:task_test/src/core/consts/dymmy_data.dart';
import 'package:task_test/src/core/consts/icons.dart';
import 'package:task_test/src/presentation/dashboard/views/app_bar_view.dart';
import 'package:task_test/src/presentation/dashboard/views/bottom_view.dart';
import 'package:task_test/src/presentation/dashboard/views/categories_view.dart';
import 'package:task_test/src/presentation/dashboard/views/header_view.dart';
import 'package:task_test/src/presentation/dashboard/views/orders_view.dart';
import 'package:task_test/src/presentation/dashboard/views/slider_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<int> _tabNotifier = ValueNotifier(0);
  final ValueNotifier<int> _sliderNotifier = ValueNotifier(0);
  final PageController _controller = PageController();
  final _tabs = ["Categories", "Services", "Orders (0)"];
  final _tabsView = [
    CategoriesView(
      categories: categories,
    ),
    const SizedBox(
      height: 100,
    ),
    const OrdersView(),
  ];

  final _sliderSize = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        var page = _controller.page!.toInt();
        if (page < _sliderSize - 1) {
          page++;
        } else {
          page = 0;
        }
        _controller.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.pureWhite,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.chromatic200,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: "Outfit",
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Outfit",
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              MyIcons.icHome,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              MyIcons.icSupportAgent,
            ),
            label: "Assets",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              MyIcons.icDashboardCustomize,
            ),
            label: "Support",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              MyIcons.icPerson,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarView(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const HeaderView(),
                    SliderView(
                      controller: _controller,
                      sliderNotifier: _sliderNotifier,
                      length: _sliderSize,
                    ),
                    BottomView(
                      tabs: _tabs,
                      tabNotifier: _tabNotifier,
                      tabsView: _tabsView,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
