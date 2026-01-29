import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TawkChatPage extends StatefulWidget {
  const TawkChatPage({super.key});

  @override
  State<TawkChatPage> createState() => _TawkChatPageState();
}

class _TawkChatPageState extends State<TawkChatPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://tawk.to/chat/691860c27460ab1958fdfe23/1ja3jjup3'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Chat')),
      body: WebViewWidget(controller: controller),
    );
  }
}
