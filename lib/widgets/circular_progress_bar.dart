import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressBar extends StatefulWidget {
  final double percent;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;

  const CircularProgressBar({
    Key? key,
    required this.percent,
    this.color = Colors.green,
    this.backgroundColor = const Color.fromARGB(255, 204, 204, 204),
    this.strokeWidth = 10,
  }) : super(key: key);

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double percentPrev = 0;

  @override
  void initState() {
    percentPrev = widget.percent;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);

    final difAnimation = widget.percent - percentPrev;
    percentPrev = widget.percent;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _CircularProgressBarCustom(
                (widget.percent - difAnimation) +
                    (difAnimation * _controller.value),
                widget.color,
                widget.backgroundColor,
                widget.strokeWidth),
          ),
        );
      },
    );
  }
}

class _CircularProgressBarCustom extends CustomPainter {
  final double percent;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;
  _CircularProgressBarCustom(
      this.percent, this.color, this.backgroundColor, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    Gradient gradient = LinearGradient(
      colors: [const Color(0xffC012ff), const Color(0xff6D05e8), color],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
      // ..color = color
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
