// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:math';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: AnimationRectangulo()));
  }
}

class AnimationRectangulo extends StatefulWidget {
  const AnimationRectangulo({Key? key}) : super(key: key);

  @override
  State<AnimationRectangulo> createState() => _AnimationRectanguloState();
}

class _AnimationRectanguloState extends State<AnimationRectangulo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _hiddenAnimation;
  late Animation<double> _moverRigthAnimation;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _animation = Tween(
      begin: 0.0,
      end: 4.0 * pi,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _opacityAnimation = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    _hiddenAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(.75, 1.0, curve: Curves.easeOut)));

    _moverRigthAnimation = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _zoomAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      // else if (status == AnimationStatus.dismissed) {
      //   _animationController.forward();
      // }
    });

    super.initState();
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
        child: _Rectangulo(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(
              _moverRigthAnimation.value,
              0,
            ),
            child: Transform.rotate(
                angle: _animation.value,
                child: Opacity(
                    opacity: _opacityAnimation.value - _hiddenAnimation.value,
                    child: Transform.scale(
                        scale: _zoomAnimation.value, child: child))),
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
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
