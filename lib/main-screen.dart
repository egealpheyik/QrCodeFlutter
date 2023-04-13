import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qrcodenew/qr-create.dart';
import 'package:qrcodenew/qr-scan.dart';
import 'package:qrcodenew/qr-scanner2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 14, child: Image.asset("assets/navheader_qr_code.png")),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateQr();
                      }));
                    },
                    child: Text(
                      "Create QR",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    )),
              ),
            ),
            /*ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScanQR();
                  }));
                },
                child: Text("Scan QR")),*/
            Expanded(
              child: Container(),
              flex: 0,
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QRScanner2Screen();
                      }));
                    },
                    child: Text(
                      "Scan QR",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ]),
    );
  }
}
