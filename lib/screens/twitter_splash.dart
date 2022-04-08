import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterSplash extends StatefulWidget {
  const TwitterSplash({Key? key}) : super(key: key);

  @override
  State<TwitterSplash> createState() => _TwitterSplashState();
}

class _TwitterSplashState extends State<TwitterSplash> {
  bool refresh = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      body: Center(
          child: ZoomOut(
              animate: refresh,
              from: 30,
              duration: const Duration(milliseconds: 500),
              child: const FaIcon(FontAwesomeIcons.twitter,
                  size: 60, color: Colors.white))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: const FaIcon(FontAwesomeIcons.arrowsRotate),
        onPressed: () {
          setState(() {
            refresh = true;
          });
        },
      ),
    );
  }
}
