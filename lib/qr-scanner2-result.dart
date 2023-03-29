import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      body: Column(children: [
        QrImage(
          data: code,
          version: QrVersions.auto,
          size: 150,
        ),
        Text(code),
        Text(deneme!),
      ]),
    );
  }
}
