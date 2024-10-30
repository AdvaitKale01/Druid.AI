import 'package:druid/theme/app_colors.dart';
import 'package:druid/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use post-frame callback to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToBaseScreen();
    });
  }

  void _navigateToBaseScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Check if widget is still mounted
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BaseScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.black,
        child: const Center(
          child: Text(
            "Druid",
            style: AppTextStyle.h6BoldWhiteGoogleSans,
          ),
        ),
      ),
    );
  }
}
