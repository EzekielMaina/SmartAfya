import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isConclusionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                _isConclusionExpanded = !_isConclusionExpanded;
              });
            },
          ),
          Visibility(
            visible: _isConclusionExpanded,
            child: Expanded(
              child: WebView(
                initialUrl: 'https://sci.maseno.ac.ke/node/297',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
