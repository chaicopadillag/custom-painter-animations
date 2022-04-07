import 'package:custom_painter/widgets/card_buttom.dart';
import 'package:custom_painter/widgets/headers.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 280, width: double.infinity),
              CardButtom(
                text: 'Notificaciones',
                primaryColor: const Color(0xff6989f5),
                secondaryColor: const Color(0xff906EF5),
                onPress: () {
                  print('Primeros Auxilios');
                },
              ),
              CardButtom(
                text: 'Medical Records',
                icon: Icons.medical_services,
                onPress: () {
                  print('Medical Records');
                },
              ),
              CardButtom(
                text: 'Seguro de Salud',
                icon: Icons.security_outlined,
                onPress: () {
                  print('Seguro de Salud');
                },
                primaryColor: Colors.orange,
                secondaryColor: Colors.orangeAccent,
              ),
              CardButtom(
                text: 'Banco de Sangre',
                icon: Icons.bloodtype,
                onPress: () {
                  print('Banco de Sangre');
                },
                primaryColor: Colors.green,
                secondaryColor: Colors.greenAccent,
              ),
              CardButtom(
                text: 'Farmacia',
                icon: Icons.medication_rounded,
                onPress: () {
                  print('Farmacia');
                },
                primaryColor: Colors.yellow,
                secondaryColor: const Color.fromARGB(255, 168, 135, 0),
              ),
            ],
          ),
          Stack(
            children: [
              const EmergencyHeader(),
              Positioned(
                  right: 10,
                  top: 40,
                  child: RawMaterialButton(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    onPressed: () {},
                    child: const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
