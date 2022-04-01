import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool isShowSkipTop;
  final Color color;
  final Color activeColor;
  final double sizeBullet;
  final double sizeBulletActive;

  const SlideShow(
      {Key? key,
      required this.slides,
      this.isShowSkipTop = false,
      this.color = Colors.grey,
      this.activeColor = Colors.blue,
      this.sizeBullet = 12,
      this.sizeBulletActive = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          _SliderProvider(color, activeColor, sizeBullet, sizeBulletActive),
      child: SafeArea(
        child: Center(
          child: Column(children: [
            if (isShowSkipTop)
              _Dots(
                length: slides.length,
              ),
            Expanded(child: _Slides(slides: slides)),
            if (!isShowSkipTop) _Dots(length: slides.length),
          ]),
        ),
      ),
    );
  }
}

// ? class internal for slide show

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      Provider.of<_SliderProvider>(context, listen: false).currentIndex =
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
      children: widget.slides.map((slide) => _Slide(child: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      child: child,
    );
  }
}

// pagination slider

class _Dots extends StatelessWidget {
  final int length;
  const _Dots({
    Key? key,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: [for (int i = 0; i < length; i++) _Dot(index: i)]),
        children: List.generate(
            length,
            (index) => _Dot(
                  index: index,
                )),
      ),
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
    final slideProv = Provider.of<_SliderProvider>(context);
    final currentIndex = slideProv.currentIndex;

    Color color;
    double size;

    if (currentIndex >= index - 0.5 && currentIndex < index + 0.5) {
      color = slideProv.activeColor;
      size = slideProv.sizeActiveBullet;
    } else {
      color = slideProv.color;
      size = slideProv.sizeBullet;
    }
    return AnimatedContainer(
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

// ? Provider for slide show

class _SliderProvider with ChangeNotifier {
  double _currentIndex = 0.0;

  late Color _color = Colors.grey;
  late Color _activeColor = Colors.pink;

  late double _sizeBullet = 12;
  late double _sizeActiveBullet = 14;

  _SliderProvider(
      this._color, this._activeColor, this._sizeBullet, this._sizeActiveBullet);

  double get sizeBullet => _sizeBullet;
  double get sizeActiveBullet => _sizeActiveBullet;

  set sizeBullet(double value) {
    _sizeBullet = value;
    notifyListeners();
  }

  set sizeActiveBullet(double value) {
    _sizeActiveBullet = value;
    notifyListeners();
  }

  double get currentIndex => _currentIndex;

  set currentIndex(double value) {
    _currentIndex = value;
    notifyListeners();
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners();
  }

  Color get activeColor => _activeColor;

  set activeColor(Color value) {
    _activeColor = value;
    notifyListeners();
  }
}
