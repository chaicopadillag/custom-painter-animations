import 'package:custom_painter/widgets/circular_progress_bar.dart';
import 'package:flutter/material.dart';

class GraficasCirculares extends StatefulWidget {
  const GraficasCirculares({Key? key}) : super(key: key);

  @override
  State<GraficasCirculares> createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
  double porcentaje = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graficas Circulares'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ListCircularProgress(porcentaje: porcentaje, color: Colors.red),
            ListCircularProgress(porcentaje: porcentaje, color: Colors.green),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ListCircularProgress(porcentaje: porcentaje, color: Colors.blue),
            ListCircularProgress(porcentaje: porcentaje, color: Colors.purple),
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
    );
  }
}

class ListCircularProgress extends StatelessWidget {
  final Color color;
  const ListCircularProgress({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      // color: Colors.red,
      child: CircularProgressBar(
        percent: porcentaje,
        color: color,
        backgroundColor: Colors.grey,
        strokeWidth: 10,
      ),
    );
  }
}
