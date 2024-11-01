import 'package:flutter/material.dart';
import 'dart:html' as html;

class GeminiScreen extends StatelessWidget {
  const GeminiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: HtmlElementView(
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
