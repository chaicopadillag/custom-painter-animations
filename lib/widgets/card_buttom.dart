import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CardButtom extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final VoidCallback onPress;

  const CardButtom({
    Key? key,
    required this.text,
    this.icon = Icons.add_alert,
    required this.onPress,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: onPress,
        child: Stack(children: [
          _BackgroundCardButtom(
            icon: icon,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 30),
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 5),
              Expanded(
                  child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: 30),
            ],
          )
        ]),
      ),
    );
  }
}

class _BackgroundCardButtom extends StatelessWidget {
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;

  const _BackgroundCardButtom({
    Key? key,
    this.icon = Icons.add_alert,
    this.primaryColor = const Color.fromRGBO(105, 137, 245, 1),
    this.secondaryColor = const Color.fromRGBO(144, 110, 245, 1),
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
          gradient: LinearGradient(
            colors: [
              primaryColor,
              secondaryColor,
            ],
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
            right: -20,
            top: -5,
            child: Icon(icon, color: Colors.white.withOpacity(0.2), size: 150),
          ),
        ]),
      ),
    );
  }
}
