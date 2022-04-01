/*import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double porcentaje = 0;
  double _progress = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.addListener(() {
      // print('valor: ${_controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, _progress, _controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 200,
            height: 200,
            // color: Colors.red,
            child: CustomPaint(painter: _CustomCircularProgress(porcentaje)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              porcentaje = _progress;
              _progress += 10.0;
              if (_progress > 100) {
                _progress = 0.0;
                porcentaje = 0;
              }
              _controller.forward(from: 0.0);
            });
          },
        ));
  }
}

class _CustomCircularProgress extends CustomPainter {
  final double percent;
  _CustomCircularProgress(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
*/