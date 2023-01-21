
import 'package:flutter/material.dart';
import 'location_page.dart';



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      home: Location_screen(),
    );
  }
}


