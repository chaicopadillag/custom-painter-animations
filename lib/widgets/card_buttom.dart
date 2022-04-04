import 'package:flutter/material.dart';

class CardButtom extends StatelessWidget {
  const CardButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _BackgroundCardButtom();
  }
}

class _BackgroundCardButtom extends StatelessWidget {
  const _BackgroundCardButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10,
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              Color(0xff6989f5),
              Color(0xff906EF5),
            ],
          )),
      child: Stack(children: const [
        Positioned(
          left: 20,
          top: 20,
          child: Icon(Icons.medical_services, color: Colors.white, size: 30),
        ),
      ]),
    );
  }
}
