import 'package:flutter/material.dart';
import 'package:custom_painter/screens/graficas_circulares.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Design',
      home: GraficasCirculares(),
    );
  }
}
