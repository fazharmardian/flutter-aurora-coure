import 'package:flutter/material.dart';

class ZoomExample extends StatefulWidget {
  const ZoomExample({super.key});

  @override
  State<ZoomExample> createState() => _ZoomExampleState();
}

class _ZoomExampleState extends State<ZoomExample> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onScaleUpdate: (details) {
            setState(() {
              _scale = details.scale;
            });
          },
          child: Transform.scale(
            scale: _scale,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: Center(child: Text('Zoom')),
            ),
          ),
        ),
      ),
    );
  }
}
