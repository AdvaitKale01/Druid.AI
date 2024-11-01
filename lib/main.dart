import 'package:druid/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';

void main() {
  // Register the iframe view factory
  ui.platformViewRegistry.registerViewFactory(
    'iframeElement',
    (int viewId) => IFrameElement()
      ..src = 'https://advaitkale01.github.io' // Set the URL of the ChatGPT website
      ..style.border = 'none'
      ..style.height = '100%'
      ..style.width = '100%',
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Druid',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
