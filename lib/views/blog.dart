import 'package:flutter/material.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPage createState() => _BlogPage();
}

class _BlogPage extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.rusticgorillapress.com/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}