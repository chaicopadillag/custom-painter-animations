import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_MainScroll(), _ButtonListView()],
    ));
  }
}

class _ButtonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: -6,
      right: 0,
      child: SizedBox(
        height: size.height * 0.1,
        width: size.width * 0.7,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xffED6762)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))))),
          onPressed: () {},
          child: const Text(
            'CREATE NEW LIST',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ItemListView('Orange', Color(0xffF08F66)),
    const _ItemListView('Family', Color(0xffF2A38A)),
    const _ItemListView('Subscriptions', Color.fromARGB(255, 245, 116, 139)),
    const _ItemListView('Books', Color.fromARGB(255, 252, 213, 71)),
    const _ItemListView('Orange', Color.fromARGB(255, 206, 116, 78)),
    const _ItemListView('Family', Color.fromARGB(255, 172, 115, 97)),
    const _ItemListView('Subscriptions', Color.fromARGB(255, 250, 71, 104)),
    const _ItemListView('Books', Color.fromARGB(255, 160, 131, 25)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 200, maxHeight: 200, child: const _Header())),
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('SliverList'),
        // ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100),
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.child,
    this.minHeight = 200,
    this.maxHeight = 200,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: child));
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              'New',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              'List',
              style: TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ]);
  }
}

class _ListTarea extends StatelessWidget {
  final items = [
    const _ItemListView('Orange', Color(0xffF08F66)),
    const _ItemListView('Family', Color(0xffF2A38A)),
    const _ItemListView('Subscriptions', Color.fromARGB(255, 245, 116, 139)),
    const _ItemListView('Books', Color.fromARGB(255, 252, 213, 71)),
    const _ItemListView('Orange', Color.fromARGB(255, 206, 116, 78)),
    const _ItemListView('Family', Color.fromARGB(255, 172, 115, 97)),
    const _ItemListView('Subscriptions', Color.fromARGB(255, 250, 71, 104)),
    const _ItemListView('Books', Color.fromARGB(255, 160, 131, 25)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ItemListView extends StatelessWidget {
  final String title;
  final Color color;

  const _ItemListView(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
