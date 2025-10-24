import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewItem extends StatelessWidget {
  final String url;

  const WebViewItem({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
