// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:as_fin/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PScreen extends StatefulWidget {
  const PScreen({super.key, required this.s});
  final String s;

  @override
  State<PScreen> createState() => _PScreenState();
}

class _PScreenState extends State<PScreen> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source: "javascript:(function() { " +
                        "var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');" +
                        "ele[0].parentNode.removeChild(ele[0]);" +
                        "var footer = document.getelementsbytagname('footer')[0];" +
                        "footer.parentnode.removechild(footer);" +
                        "})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.s),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
