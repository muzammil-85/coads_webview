import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: WillPopScope(
          onWillPop: () async {
            if (await _webViewController.canGoBack()) {
              _webViewController.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: SafeArea(
            child: WebView(
              initialUrl: "https://www.amazon.com/",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
        ));
  }
}
