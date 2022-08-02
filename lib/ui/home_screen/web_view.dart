import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {

  final String newsURL;
  final String title;

  const NewsWebView({
    Key? key,
    required this.title,
    required this.newsURL
  }) : super(key: key);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {

  int _progressValue=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(
          color: Colors.black
        ),),
        iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.6)
        ),
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: widget.newsURL,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress){
          setState(() {
            _progressValue=progress;
          });
        },
      ),
    );
  }
}
