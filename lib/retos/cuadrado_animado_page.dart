// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationMoveTop;
  late Animation<double> _animationMoveBottom;
  late Animation<double> _animationMoveLeft;
  late Animation<double> _animationMoveRight;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _animationMoveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    _animationMoveTop = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut)));

    _animationMoveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.75, curve: Curves.easeOut)));

    _animationMoveBottom = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      }
      // else if (status == AnimationStatus.dismissed) {
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return AnimatedBuilder(
      animation: _animationController,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_animationMoveRight.value + _animationMoveLeft.value,
              _animationMoveTop.value + _animationMoveBottom.value),
          child: child,
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue,
        // borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
