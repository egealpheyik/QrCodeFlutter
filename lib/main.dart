import 'package:flutter/material.dart';
import 'package:qrcodenew/main-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: customSwatch,
        primarySwatch: Colors.amber,
        //primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color.fromRGBO(93, 103, 117, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
