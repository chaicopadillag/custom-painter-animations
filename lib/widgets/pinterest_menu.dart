import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final VoidCallback onPressed;

  const PinterestButton({
    required this.icon,
    required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  // List<PinterestButton> items = [    ];
  late bool isVisibile;
  late Color backgroundColor = Colors.white;
  late Color color;
  late Color activeColor;
  List<PinterestButton> items;

  PinterestMenu(
      {Key? key,
      required this.items,
      this.isVisibile = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(color, activeColor),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isVisibile ? 1 : 0,
        child: Container(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: _Menu(items: items)),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length,
            (index) => _ItemMenu(index: index, item: items[index])),
      ),
    );
  }
}

class _ItemMenu extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _ItemMenu({Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProv = Provider.of<_MenuProvider>(context);
    final isActive = menuProv.selectedIndex;

    final color = menuProv.color;
    final activeColor = menuProv.activeColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuProvider>(context, listen: false).selectedIndex =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        color: (isActive == index) ? activeColor : color,
        size: (isActive == index) ? 30 : 28,
      ),
    );
  }
}

// Provider

class _MenuProvider with ChangeNotifier {
  int _selectedIndex = 0;
  Color color = Colors.black54;
  Color activeColor = Colors.black;

  _MenuProvider(
    this.color,
    this.activeColor,
  );

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
