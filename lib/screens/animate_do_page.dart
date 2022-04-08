import 'package:animate_do/animate_do.dart';
import 'package:custom_painter/screens/navigation_bar_page.dart';
import 'package:custom_painter/screens/twitter_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimateDoPage extends StatelessWidget {
  const AnimateDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const Text('AnimateDo')),
        actions: [
          FadeIn(
            delay: const Duration(milliseconds: 800),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TwitterSplash(),
                  ),
                );
              },
            ),
          ),
          SlideInLeft(
            from: 25,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const NavigationBarPage()));
                },
                icon: const FaIcon(FontAwesomeIcons.bars)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1500),
              child: const FaIcon(
                FontAwesomeIcons.infinity,
                size: 60,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            FadeInDown(
              delay: const Duration(milliseconds: 400),
              child: const Text(
                'Infinity',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                'A más allá del infinito',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1200),
              child: Container(
                width: 200,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
