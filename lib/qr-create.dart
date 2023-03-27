import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({super.key});

  @override
  State<CreateQr> createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQr> {
  TextEditingController qrController = TextEditingController();
  bool hasUsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QR Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: qrController,
            decoration: InputDecoration(
                hintText: "Enter text", border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  hasUsed = true;
                });
              },
              child: Text("Generate Qr Code")),
          Visibility(
            visible: hasUsed,
            child: QrImage(data: qrController.toString()),
          )
        ]),
      ),
    );
  }
}
