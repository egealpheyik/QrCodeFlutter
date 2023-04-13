import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcodenew/qr-create.dart';
import 'package:qrcodenew/qr-scanner2-result.dart';

class QRScanner2Screen extends StatefulWidget {
  const QRScanner2Screen({super.key});
  @override
  State<QRScanner2Screen> createState() => _QRScanner2ScreenState();
}

class _QRScanner2ScreenState extends State<QRScanner2Screen> {
  bool isScanCompleted = false;
  MobileScannerController cameraController = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Scanner"),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Center(
            child: Text("Place the QR code in the area"),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 50),
            child: MobileScanner(
              controller: cameraController,
              onDetect: (barcode) {
                Navigator.pop(context);
                String code = barcode.toString();
                final List<Barcode> barcodes = barcode.barcodes;
                for (final the_barcode in barcodes) {
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
          child: Center(
            child: Text(
              "Scanning will start automatically",
            ),
          ),
        ),
      ]),
    );
  }
}
