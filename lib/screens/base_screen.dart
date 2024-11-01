import 'package:flutter/material.dart';

import 'gemini_screen.dart';

class BaseScreen extends StatefulWidget {
  static String routeName = "/base-screen";
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: GeminiScreen(),
          ),
        ],
      ),
    );
  }
}
