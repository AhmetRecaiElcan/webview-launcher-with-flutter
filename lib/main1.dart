import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Tarayıcı',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Tarayıcı'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _controller.goBack(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => _controller.goForward(),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'URL Giriniz'),
            onSubmitted: (url) {
              _controller.loadUrl(url);
            },
          ),
          Expanded(
            child: WebView(
              initialUrl: 'https://www.google.com',
              onWebViewCreated: (controller) {
                _controller = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
