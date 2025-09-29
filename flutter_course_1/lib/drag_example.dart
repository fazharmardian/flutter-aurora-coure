import 'package:flutter/material.dart';

class DragExample extends StatefulWidget {
  const DragExample({super.key});

  @override
  State<DragExample> createState() => _DragExampleState();
}

class _DragExampleState extends State<DragExample> {
  double x = 0, y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: x,
            top: y,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  x += details.delta.dx;
                  y += details.delta.dy;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text('Drag Me')),
              ),
            )
          )
        ],
      ),
    );
  }
}