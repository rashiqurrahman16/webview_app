import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebViewDemo(),
    );
  }
}

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({super.key});

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  WebViewController controller = WebViewController();

  @override
  void initState(){
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => {
            // Update loading bar.
          },
          onPageStarted: (url) {},
          onPageFinished: (url) {},
          // onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse('https://expense.asifdev.me/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Google'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}






