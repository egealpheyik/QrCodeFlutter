import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome to the QR Scanner",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.end,
          ),
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 63, 163, 245)),
          ),
        ),
        body: Container(
            height: Responsive.height(context),
            width: Responsive.width(100, context),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.red, Colors.blue])),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                    top: 190,
                    left: 80,
                    child: InkWell(
                      onTap: () {
                        color:
                        const Color(0xfffff9ae);
                      },
                      child: Container(
                          height: 75,
                          width: 270,
                          decoration: BoxDecoration(
                              color: const Color(0xfffff9ae),
                              borderRadius: BorderRadius.circular(240)),
                          padding: const EdgeInsets.only(top: 13),
                          child: const Text("Scan QR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, color: Colors.black))),
                    )),
                Positioned(
                    top: 370,
                    left: 80,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 75,
                          width: 270,
                          decoration: BoxDecoration(
                              color: const Color(0xfffff9ae),
                              borderRadius: BorderRadius.circular(240)),
                          padding: const EdgeInsets.only(top: 13),
                          child: const Text("Generate QR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40, color: Colors.black))),
                    ))
              ],
            )));
  }
}

class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }
}
