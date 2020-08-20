import 'package:flutter/material.dart';
import 'package:flutter_gallery/view/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gallery',
      home: HomePage(),
    );
  }
}

