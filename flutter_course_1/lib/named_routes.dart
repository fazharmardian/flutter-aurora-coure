import 'package:flutter/material.dart';

class NamedRoutes extends StatelessWidget {
  const NamedRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPageRN(),
        '/second': (context) => SecondPageRN()
      },
    );
  }
}

class FirstPageRN extends StatefulWidget {
  const FirstPageRN({super.key});

  @override
  State<FirstPageRN> createState() => _FirstPageRNState();
}

class _FirstPageRNState extends State<FirstPageRN> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Halaman Utama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          }, 
          child: const Text(
            'Pergi Ke Halaman Kedua'
          ) 
        ),
      ),
    );
  }
}

class SecondPageRN extends StatelessWidget {
  const SecondPageRN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Kedua')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text(
            'Kembali Ke Halaman Utama'
          ) 
        ),
      ),
    );
  }
}