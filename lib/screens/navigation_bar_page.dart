import 'package:animate_do/animate_do.dart';
import 'package:custom_painter/providers/animation_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationBarPage extends StatelessWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnimationProvider(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: const Text('Notification'),
          ),
          floatingActionButton: _MyFluttingActionButton(),
          bottomNavigationBar: _MyNavigationBarButton()),
    );
  }
}

class _MyNavigationBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Stack(
              children: [const FaIcon(FontAwesomeIcons.bell), _CounterNotify()],
            ),
            label: 'Notification'),
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
      ],
    );
  }
}

class _CounterNotify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<AnimationProvider>(context).countNotify;
    return Positioned(
      right: 0,
      top: 0,
      child: BounceInDown(
        animate: count > 0,
        from: 15,
        child: Bounce(
          from: 15,
          controller: (controller) =>
              Provider.of<AnimationProvider>(context, listen: false)
                  .controller = controller,
          child: Container(
            width: 14,
            height: 14,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyFluttingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.plus),
      onPressed: () =>
          Provider.of<AnimationProvider>(context, listen: false).increment(),
    );
  }
}
