import 'package:druid/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class GeminiScreen extends StatefulWidget {
  const GeminiScreen({super.key});

  @override
  State<GeminiScreen> createState() => _GeminiScreenState();
}

class _GeminiScreenState extends State<GeminiScreen> {
  final GlobalKey webViewKey = GlobalKey();
  bool? isSecure;
  String url = 'https://gemini.google.com/';
  InAppWebViewController? webViewController;

  static bool urlIsSecure(Uri url) {
    return (url.scheme == "https") || isLocalizedContent(url);
  }

  static bool isLocalizedContent(Uri url) {
    return (url.scheme == "file" ||
        url.scheme == "chrome" ||
        url.scheme == "data" ||
        url.scheme == "javascript" ||
        url.scheme == "about");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: WebUri(url)),
            initialSettings: InAppWebViewSettings(
                transparentBackground: true,
                safeBrowsingEnabled: true,
                isFraudulentWebsiteWarningEnabled: true),
            onWebViewCreated: (controller) async {
              webViewController = controller;
              if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
                await controller.startSafeBrowsing();
              }
            },
            onLoadStart: (controller, url) {
              if (url != null) {
                setState(() {
                  this.url = url.toString();
                  isSecure = urlIsSecure(url);
                });
              }
            },
            onLoadStop: (controller, url) async {
              if (url != null) {
                setState(() {
                  this.url = url.toString();
                });
              }

              final sslCertificate = await controller.getCertificate();
              setState(() {
                isSecure =
                    sslCertificate != null || (url != null && urlIsSecure(url));
              });
            },
            onUpdateVisitedHistory: (controller, url, isReload) {
              if (url != null) {
                setState(() {
                  this.url = url.toString();
                });
              }
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              final url = navigationAction.request.url;
              if (navigationAction.isForMainFrame &&
                  url != null &&
                  ![
                    'http',
                    'https',
                    'file',
                    'chrome',
                    'data',
                    'javascript',
                    'about'
                  ].contains(url.scheme)) {
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                  return NavigationActionPolicy.CANCEL;
                }
              }
              return NavigationActionPolicy.ALLOW;
            },
          ),
        ],
      ),
    );
  }
}
