import '../components/MyWebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WebviewDemo extends StatefulWidget {
  WebviewDemo({Key key}) : super(key: key);

  @override
  _WebviewDemoState createState() => _WebviewDemoState();
}

class _WebviewDemoState extends State<WebviewDemo> {
  TextEditingController _urlController = new TextEditingController();
  void initState() {
    super.initState();
    _urlController.text = 'http://192.168.1.65:8080';
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ///防止多次进入
    new Future.delayed(const Duration(milliseconds: 200), () {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 40.0),
            TextFormField(
              // initialValue: 'http://192.168.1.65:8080',
              controller: _urlController,
            ),
            Container(height: 20.0),
            CupertinoButton.filled(
              child: Text('进入webview'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyWebview(url: _urlController.text,),
                  ),
                );
              },
            ),
          ],
        )
      )
    );
  }
}