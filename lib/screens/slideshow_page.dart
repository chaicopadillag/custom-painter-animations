import 'package:custom_painter/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pinkAccent,
      body: Column(children: const [
        Expanded(child: MySlideShow()),
        Expanded(child: MySlideShow()),
      ]),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
        color: Colors.black54,
        activeColor: Colors.pink,
        sizeBullet: 12,
        sizeBulletActive: 16,
        slides: [
          SvgPicture.asset('assets/svg/android.svg'),
          SvgPicture.asset('assets/svg/flutter_dev.svg'),
          SvgPicture.asset('assets/svg/mobile_application.svg'),
          SvgPicture.asset('assets/svg/online_messaging.svg'),
          SvgPicture.asset('assets/svg/sentimient_analysis.svg'),
          SvgPicture.asset('assets/svg/accept_terms.svg'),
          SvgPicture.asset('assets/svg/sync.svg'),
        ]);
  }
}
