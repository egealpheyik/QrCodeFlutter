import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcodenew/qr-scanner2-result.dart';

class QRScanner2Screen extends StatefulWidget {
  const QRScanner2Screen({super.key});
  @override
  State<QRScanner2Screen> createState() => _QRScanner2ScreenState();
}

class _QRScanner2ScreenState extends State<QRScanner2Screen> {
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 50),
            child: MobileScanner(
              onDetect: (barcode) {
                String code = barcode.toString();
                final List<Barcode> barcodes = barcode.barcodes;
                for (final the_barcode in barcodes) {
                  debugPrint('Barcode found! ${the_barcode.rawValue}');
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ScannerResultScreen(
                        code: code,
                        deneme: the_barcode.rawValue,
                      );
                    },
                  ));
                }
                if (!isScanCompleted) {
                  isScanCompleted = true;
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
      ]),
    );
  }
}
