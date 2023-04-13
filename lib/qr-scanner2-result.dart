import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerResultScreen extends StatelessWidget {
  final String code;
  Barcode? result;
  String? deneme;
  ScannerResultScreen({
    Key? key,
    required this.code,
    required this.deneme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(flex: 4, child: Container()),
          QrImage(
            backgroundColor: Colors.white,
            data: code,
            version: QrVersions.auto,
            size: 150,
          ),
          //Text(code),
          Expanded(flex: 1, child: Container()),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: deneme));
                    final snackBar = SnackBar(
                      content: Center(child: Text('copied to blackboard')),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.copy,
                      ),
                      Text("copy link"),
                    ],
                  ),
                ),
              ),
              Flexible(
                  child: Text(deneme!, style: TextStyle(color: Colors.white))),
            ],
          ),
          Expanded(flex: 1, child: Container()),

          Expanded(flex: 1, child: Container()),
          Visibility(
              visible: deneme![4] != "s",
              child: Text("This link is not secure")),
          Expanded(flex: 0, child: Container()),
          Visibility(
            visible: (deneme![4] == "s"),
            child: ElevatedButton(
              onPressed: () async {
                final url = deneme;
                if (await canLaunch(url!)) {
                  await launch(url);
                } else {
                  debugPrint("Unable to launch URL");
                }
              },
              child: Text("Go to the link"),
            ),
          ),
          Expanded(flex: 2, child: Container()),
        ]),
      ),
    );
  }
}
