import 'package:custom_painter/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(),
      child: Scaffold(
        body: Stack(children: [
          const _PinterestGrid(),
          _PinterestMenuLocation(),
        ]),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final isVisible = Provider.of<_MenuProvider>(context).isVisible;
    return Positioned(
        bottom: 20,
        child: SizedBox(
            width: sizeScreen.width,
            child: Align(
                child: PinterestMenu(
              isVisibile: isVisible,
              items: [
                PinterestButton(
                  icon: Icons.pie_chart,
                  onPressed: () {
                    print('pie_chart');
                  },
                ),
                PinterestButton(
                  icon: Icons.search,
                  onPressed: () {
                    print('search');
                  },
                ),
                PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () {
                    print('notifications');
                  },
                ),
                PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () {
                    print('supervised_user_circle');
                  },
                ),
                PinterestButton(icon: Icons.usb, onPressed: () {})
              ],
            ))));
  }
}

class _PinterestGrid extends StatefulWidget {
  const _PinterestGrid({Key? key}) : super(key: key);

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final ScrollController _scrollController = ScrollController();
  double scrollPrev = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > scrollPrev &&
          _scrollController.offset > 150) {
        Provider.of<_MenuProvider>(context, listen: false).isVisible = false;
      } else {
        Provider.of<_MenuProvider>(context, listen: false).isVisible = true;
      }
      scrollPrev = _scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem(index: index),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

// ? Provider

class _MenuProvider with ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}
