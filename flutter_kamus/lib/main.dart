import 'package:flutter/material.dart';
import 'package:flutter_kamus/view/pages/pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This view.widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kamus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
