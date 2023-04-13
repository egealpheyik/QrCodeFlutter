import 'dart:ffi';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({super.key});

  @override
  State<CreateQr> createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQr> {
  GlobalKey _qrKey = GlobalKey();
  TextEditingController qrController = TextEditingController();
  bool hasUsed = false;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Generate QR Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintText: "Enter text",
              hintStyle: TextStyle(color: Colors.amber),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  hasUsed = true;
                });
              },
              child: Text("Generate Qr Code")),
          Visibility(
              child: QrImage(
                data: qrController.text,
              ),
              visible: hasUsed),
          Visibility(
            visible: hasUsed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ElevatedButton(onPressed: () async {}, child: child)
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                      onPressed: () async {
                        final image = await screenshotController
                            .captureFromWidget(getQr());
                        if (image == null) {
                          debugPrint("image is null----");
                          return;
                        }
                        await saveQR(image);
                        final snackBar = SnackBar(
                            content: Center(
                                child: Text("QR code saved to the gallery")));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("save qr to gallery")),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                      onPressed: () async {
                        debugPrint("hwhwhwhw");

                        final image = await screenshotController
                            .captureFromWidget(getQr());
                        shareQr(image);
                      },
                      child: Text("share")),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget blankWidget() {
    return ElevatedButton(onPressed: () {}, child: Text("abc"));
  }

  Widget getQr() {
    return ElevatedButton(
        onPressed: () {}, child: QrImage(data: qrController.text));
  }

  Future<String> saveQR(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(":", ".")
        .replaceAll("-", ".");
    await [Permission.storage].request();
    final result =
        await ImageGallerySaver.saveImage(bytes, name: "screenshot$time");
    return result['filePath'];
  }

  Future shareQr(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytes(bytes);
    try {
      await Share.shareFiles([image.path]);
    } catch (e) {
      debugPrint("heyooo$e");
    }
  }
}
