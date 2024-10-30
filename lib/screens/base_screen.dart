import 'package:druid/screens/chatgpt_screen.dart';
import 'package:druid/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import 'gemini_screen.dart';

class BaseScreen extends StatefulWidget {
  static String routeName = "/base-screen";
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const GeminiScreen(),
      const ChatgptScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SlideSwitcher(
            onSelect: (index) {
              setState(() {
                _sliderIndex = index;
              });
            },
            slidersColors: const [AppColors.spaceBright],
            containerColor: AppColors.spaceBlack,
            containerHeight: 40,
            containerWight: MediaQuery.of(context).size.width - 20,
            initialIndex: 0,
            children: const [
              Text(
                'Gemini',
                style: AppTextStyle.h6BoldWhiteGoogleSans,
              ),
              Text(
                'ChatGPT',
                style: AppTextStyle.h6BoldWhiteGoogleSans,
              ),
              Text(
                'Settings',
                style: AppTextStyle.h6BoldWhiteGoogleSans,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: screens[_sliderIndex],
            ),
          ),
        ],
      ),
    );
  }
}
