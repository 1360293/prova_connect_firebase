import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página principal')),
      body: const Center(
        child: Text('Bienvenido a Home', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
