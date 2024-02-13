import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Örneği',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  late WebViewController _webViewController;
  String _currentUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'URL giriniz',
            border: InputBorder.none,
          ),
          onSubmitted: (url) {
            _webViewController.loadUrl(url);
          },
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_webViewController != null && _currentUrl != '') {
              _webViewController.goBack();
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              if (_webViewController != null && _currentUrl != '') {
                _webViewController.reload();
              }
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'https://ahmetrecaielcan.github.io/honorable/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _webViewController = controller;
          _webViewController.currentUrl().then((url) {
            setState(() {
              _currentUrl = url.toString();
            });
          });
        },
        onPageStarted: (url) {
          setState(() {
            _currentUrl = url;
          });
        },
        onPageFinished: (url) {
          setState(() {
            _currentUrl = url;
          });
        },
      ),
    );
  }
}
