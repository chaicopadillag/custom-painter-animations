/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:custom_painter/providers/slider_provide.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: Scaffold(
        body: Center(
          child: Column(children: [
            const Expanded(child: _Slides()),
            _Dots(),
          ]),
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({
    Key? key,
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      Provider.of<SliderProvider>(context, listen: false).currentIndex =
          _controller.page ?? 0;
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
    return PageView(
      controller: _controller,
      children: const [
        _Slide(pathSvg: 'assets/svg/android.svg'),
        _Slide(pathSvg: 'assets/svg/flutter_dev.svg'),
        _Slide(pathSvg: 'assets/svg/mobile_application.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String pathSvg;
  const _Slide({
    Key? key,
    required this.pathSvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      child: SvgPicture.asset(
        pathSvg,
        semanticsLabel: 'Flutter Logo',
      ),
    );
  }
}

// pagination slider

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Dot(
          index: 0,
        ),
        _Dot(
          index: 1,
        ),
        _Dot(
          index: 2,
        ),
      ]),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<SliderProvider>(context).currentIndex;

    return AnimatedContainer(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (currentIndex >= index - 0.5 && currentIndex < index + 0.5)
            ? Colors.pink
            : Colors.grey,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
*/